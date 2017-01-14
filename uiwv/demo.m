//
//  ViewControllerB.m
//  uiwv
//
//  Created by 高志强 on 2016/12/14.
//  Copyright © 2016年 高志强. All rights reserved.
//

#import "demo.h"
//引用h5类
#import "h5.h"
#import "H5Update.h"
#import "detailVC.h"
#import "AFNetworking.h"
@interface demo ()
{
//需要用到的变量
    //放数据
    NSString *_data;
    //放h5object
    h5 *webViewh5;
    //放webview
    UIWebView *webView;
    NSNumber *h5Version;
}
//js要跳页时调用
-(void)go:(NSString *)pid;
//js准备完成时调用
-(void)load:(NSString *)js;
-(void)runH5;
@end

@implementation demo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _data=@"[{id:'001',title:'冠心病',icon:'#',dsc:'2016全球精准医疗（中国）峰会圆满召开！',list:[{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']}]},{id:'002',title:'冠心病',icon:'#',dsc:'2016全球精准医疗（中国）峰会圆满召开！',list:[{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']}]},{id:'003',title:'冠心病',icon:'#',dsc:'2016全球精准医疗（中国）峰会圆满召开！',list:[{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']}]},{id:'004',title:'冠心病',icon:'#',dsc:'2016全球精准医疗（中国）峰会圆满召开！',list:[{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']}]},{id:'005',title:'冠心病',icon:'#',dsc:'2016全球精准医疗（中国）峰会圆满召开！',list:[{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']}]},{id:'006',title:'冠心病',icon:'#',dsc:'2016全球精准医疗（中国）峰会圆满召开！',list:[{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']}]},{id:'007',title:'冠心病',icon:'#',dsc:'2016全球精准医疗（中国）峰会圆满召开！',list:[{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']}]},{id:'008',title:'冠心病',icon:'#',dsc:'2016全球精准医疗（中国）峰会圆满召开！',list:[{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']}]},{id:'009',title:'冠心病',icon:'#',dsc:'2016全球精准医疗（中国）峰会圆满召开！',list:[{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']}]},{id:'010',title:'冠心病',icon:'#',dsc:'2016全球精准医疗（中国）峰会圆满召开！',list:[{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']}]},{id:'011',title:'冠心病',icon:'#',dsc:'2016全球精准医疗（中国）峰会圆满召开！',list:[{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']}]}]";
    
    //前面写服务器给的域名,后面拼接上需要提交的参数，假如参数是key＝1
    NSString *domainStr = @"http://192.168.1.139?version=0";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:domainStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    }
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             
             h5Version=[responseObject objectForKey:@"version"];
             NSLog(@"%@", h5Version);
             if([h5Version isEqual:0]){
                 [self runH5];
             }else{
                 [[H5Update alloc] check:^(){
                     [self runH5];
                 } version:h5Version];
             }
             
             
         }
     
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull   error) {
             
             NSLog(@"%@",error);  //这里打印错误信息
             
   }];    //模拟数据已经取好
    
    /*
    
    */

    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)go:(NSString *)pid{
    detailVC *page = [[detailVC alloc]init];
    [page setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    //跳页
    [self presentViewController:page animated:YES completion:nil];
};
-(void)load:(NSString *)js{
//OC调用js
    NSLog(@"load");
[webViewh5 call:[NSString stringWithFormat:@"set(%@)",_data]];
};
-(void)runH5{
    //初始化h5 init:self frame:CGRectMake(x, y, w, h) url:@"文件名" callback:回调一个webView
    webViewh5 = [[h5 alloc] init:self frame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height - 20) url:@"index" callback:^(UIWebView* view){
        webView = view;
        //把回调webView放进视图
        [self.view addSubview:view];
    }];
}
@end
