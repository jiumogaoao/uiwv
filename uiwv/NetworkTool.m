//
//  NetworkTool.m
//  uiwv
//
//  Created by 高志强 on 2017/1/23.
//  Copyright © 2017年 高志强. All rights reserved.
//

#import "NetworkTool.h"

@implementation NetworkTool
-(void)get:(NSString *)path target:(id)targetObject callback:(NSString *)callbackName{
 
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:path parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    }
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             
             SEL func_selector = NSSelectorFromString([NSString stringWithFormat:@"%@:",callbackName]);
             if ([targetObject respondsToSelector:func_selector]) {
                 [targetObject performSelector:func_selector withObject:responseObject];
             }
             
         }
     
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull   error) {
             
             NSLog(@"%@",error);  //这里打印错误信息
             
         }];
    
};
-(void)post:(NSString *)path data:(NSMutableDictionary*)dataObject target:(id)targetObject callback:(NSString *)callbackName{
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:path parameters:dataObject progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        SEL func_selector = NSSelectorFromString([NSString stringWithFormat:@"%@:",callbackName]);
        if ([targetObject respondsToSelector:func_selector]) {
            [targetObject performSelector:func_selector withObject:responseObject];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);  //这里打印错误信息
    }];
    
};
-(void)upLoad:(NSString *)path data:(NSMutableDictionary*)dataObject filePath:(NSString *)filePathName name:(NSString *)nameStr fileName:(NSString *)fileNameStr target:(id)targetObject callback:(NSString *)callbackName{
    //1.创建管理者对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //2.上传文件

    [manager POST:path parameters:dataObject constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileURL:[NSURL fileURLWithPath:filePathName] name:nameStr fileName:fileNameStr mimeType:@"application/octet-stream" error:nil];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        //打印下上传进度
        NSLog(@"%lf",1.0 *uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //请求成功
        NSLog(@"请求成功：%@",responseObject);
        SEL func_selector = NSSelectorFromString([NSString stringWithFormat:@"%@:",callbackName]);
        if ([targetObject respondsToSelector:func_selector]) {
            [targetObject performSelector:func_selector withObject:responseObject];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //请求失败
        NSLog(@"请求失败：%@",error);
    }];
};
-(void)downLoad:(NSString *)path filePath:(NSString *)filePathName target:(id)targetObject callback:(NSString *)callbackName{
    
    //1.创建管理者对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //2.确定请求的URL地址
    NSURL *url = [NSURL URLWithString:path];
    
    //3.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //下载任务
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        //打印下下载进度
        NSLog(@"%lf",1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        //下载地址
        //设置下载路径，通过沙盒获取缓存地址，最后返回NSURL对象
        NSFileManager *fm=[NSFileManager defaultManager];
        NSURL *documentsDirectoryURL = [fm URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        
        return [documentsDirectoryURL URLByAppendingPathComponent:filePathName];
        
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        //下载完成调用的方法
        NSLog(@"下载完成：");
        NSLog(@"%@--%@",response,filePath);
        
        SEL func_selector = NSSelectorFromString([NSString stringWithFormat:@"%@:",callbackName]);
        if ([targetObject respondsToSelector:func_selector]) {
            id responseObject;
            [targetObject performSelector:func_selector withObject:responseObject];
        }    }];
    
    //开始启动任务
    [task resume];
    
};
@end
