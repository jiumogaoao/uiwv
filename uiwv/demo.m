//
//  ViewControllerB.m
//  uiwv
//
//  Created by 高志强 on 2016/12/14.
//  Copyright © 2016年 高志强. All rights reserved.
//

#import "demo.h"
#import "h5.h"
#import "detailVC.h"
@interface demo ()
{
    NSString *_data;
    h5 *webViewh5;
    UIWebView *webView;
    h5 *webViewh5B;
    UIWebView *webViewB;
}
-(void)totop:(NSString *)js;
-(void)tomain:(NSString *)js;
-(void)go:(NSString *)pid;
@end

@implementation demo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Web+Native";
    _data=@"[{id:'001',title:'冠心病',icon:'#',dsc:'2016全球精准医疗（中国）峰会圆满召开！',list:[{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']}]},{id:'002',title:'冠心病',icon:'#',dsc:'2016全球精准医疗（中国）峰会圆满召开！',list:[{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']}]},{id:'003',title:'冠心病',icon:'#',dsc:'2016全球精准医疗（中国）峰会圆满召开！',list:[{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']}]},{id:'004',title:'冠心病',icon:'#',dsc:'2016全球精准医疗（中国）峰会圆满召开！',list:[{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']}]},{id:'005',title:'冠心病',icon:'#',dsc:'2016全球精准医疗（中国）峰会圆满召开！',list:[{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']}]},{id:'006',title:'冠心病',icon:'#',dsc:'2016全球精准医疗（中国）峰会圆满召开！',list:[{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']}]},{id:'007',title:'冠心病',icon:'#',dsc:'2016全球精准医疗（中国）峰会圆满召开！',list:[{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']}]},{id:'008',title:'冠心病',icon:'#',dsc:'2016全球精准医疗（中国）峰会圆满召开！',list:[{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']}]},{id:'009',title:'冠心病',icon:'#',dsc:'2016全球精准医疗（中国）峰会圆满召开！',list:[{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']}]},{id:'010',title:'冠心病',icon:'#',dsc:'2016全球精准医疗（中国）峰会圆满召开！',list:[{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']}]},{id:'011',title:'冠心病',icon:'#',dsc:'2016全球精准医疗（中国）峰会圆满召开！',list:[{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:0,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:'#'},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']},{id:'',type:1,title:'健康医疗科技精准对接会暨陕西省国家临床医学研究中心',praise:0,time:'2016/12/06',icon:['#','#','#']}]}]";
    CGFloat ReSize = self.view.bounds.size.width/750;
    webViewh5 = [[h5 alloc] init:self frame:CGRectMake(0, 20, self.view.bounds.size.width, 88*ReSize) url:@"top" callback:^(UIWebView* view){
        webView = view;
        [self.view addSubview:view];
        [webViewh5 call:[NSString stringWithFormat:@"setTimeout(function(){set(%@)},50)",_data]];
    }];
    
    
    //////////////////////
    webViewh5B = [[h5 alloc] init:self frame:CGRectMake(0, 20+88*ReSize, self.view.bounds.size.width, self.view.bounds.size.height - 20 -88*ReSize) url:@"index" callback:^(UIWebView* view){
        webViewB = view;
        [self.view addSubview:view];
        [webViewh5B call:[NSString stringWithFormat:@"setTimeout(function(){set(%@)},50)",_data]];
    }];
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
-(void)totop:(NSString *)js{
    [webViewh5 call:js];
};
-(void)tomain:(NSString *)js{
    [webViewh5B call:js];
};
-(void)go:(NSString *)pid{
    detailVC *page = [[detailVC alloc]init];
    [page setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:page animated:YES completion:nil];
};
@end
