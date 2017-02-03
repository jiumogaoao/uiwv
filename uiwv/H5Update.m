//
//  H5Update.m
//  iosUpdate
//
//  Created by 高志强 on 2017/1/4.
//  Copyright © 2017年 高志强. All rights reserved.
//

#import "H5Update.h"
#import "ZipArchive.h"
#import "AFNetworking.h"
@interface H5Update ()
{
    NSString *fileName;
    NSString *folderName;
    NSFileManager *fm;
    NSString *dcoumentpath;
    NSString *varsionpath;
    NSString *localVersion;
    NSNumber *versionNumber;
    NSNumber *h5Version;
    BlockVoid endFn;
}
-(void)reflash;
@end
@implementation H5Update
-(void) check:(BlockVoid)callBlack{
    endFn=callBlack;
    
    fm=[NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    dcoumentpath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    varsionpath =[NSString stringWithFormat:@"%@/%@",dcoumentpath,@"h5Version"];
    if([fm fileExistsAtPath:varsionpath]){
        NSData *versionData = [[NSData alloc] initWithContentsOfFile:varsionpath];
        //NSData转化成NSString
        localVersion = [[NSString alloc] initWithData:versionData encoding:NSUTF8StringEncoding];
    }else{
        //如何创建文件
        NSString *str = @"0";
        //writeToFile
        //fm createFileAtPath:@"路径" contents: NSData类型的数据 attributes:文件的属性的字典
        //创建NSData?   是一个处理二进制数据的类
        //NSString -----> NSData  (把NSString转化成NSData)
        
        NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
        BOOL isYes;
        // createFileAtPath 创建文件
        isYes = [fm createFileAtPath:varsionpath contents:data attributes:nil];
        NSLog(@"isYes = %d",isYes);
        localVersion = @"0";
    }

    //前面写服务器给的域名,后面拼接上需要提交的参数，假如参数是key＝1
    NSString *domainStr = [NSString stringWithFormat:@"http://192.168.1.105?version=%@",localVersion];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:domainStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    }
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             
             h5Version=(NSNumber *)[responseObject objectForKey:@"version"];
             NSLog(@"netVersion%@", h5Version);
             if([h5Version isEqual:@0]){
                 endFn();
             }else{
                 versionNumber = h5Version;
                 [fm removeItemAtPath:varsionpath error:nil];
                 NSString *str = [versionNumber stringValue];
                 NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
                 BOOL isYes;
                 // createFileAtPath 创建文件
                 isYes = [fm createFileAtPath:varsionpath contents:data attributes:nil];
                 NSLog(@"isYes = %d",isYes);
                 [self reflash];
             }
             
             
         }
     
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull   error) {
             
             NSLog(@"%@",error);  //这里打印错误信息
             
         }];
};
-(void)reflash{
    fileName=@"ztxH5.zip";
    folderName=@"/h5";
    [fm removeItemAtPath:[dcoumentpath stringByAppendingString:folderName] error:nil];
    [fm removeItemAtPath:[NSString stringWithFormat:@"%@/%@",dcoumentpath,fileName] error:nil];
    //1.创建管理者对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //2.确定请求的URL地址
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat: @"http://192.168.1.105/down/%@.zip",versionNumber]];
    //3.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //下载任务
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        //打印下下载进度
        NSLog(@"%lf",1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        // 告诉服务器下载的文本保存的位置在那里
        NSURL *documentsDirectoryURL = [fm URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        
        return [documentsDirectoryURL URLByAppendingPathComponent:fileName];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        //下载完成调用的方法
        ZipArchive* zip = [[ZipArchive alloc] init];
        
        NSString* l_zipfile = [NSString stringWithFormat:@"%@/%@",dcoumentpath,fileName];
        NSString* unzipto = [dcoumentpath stringByAppendingString:folderName] ;
        NSLog(@"%@", unzipto);
        if( [zip UnzipOpenFile:l_zipfile] ) {NSLog(@"找到文件");
            BOOL ret = [zip UnzipFileTo:unzipto overWrite:YES];
            if( NO==ret ) {
            }else{
                [fm removeItemAtPath:l_zipfile error:nil];
                endFn();
            }
            [zip UnzipCloseFile];
        }
    }];
    
    //开始启动任务
    [task resume];
};
@end
