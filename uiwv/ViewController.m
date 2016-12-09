//
//  ViewController.m
//  uiwv
//
//  Created by 高志强 on 2016/12/1.
//  Copyright © 2016年 高志强. All rights reserved.
//

#import "ViewController.h"
#import "RequestH5.h"
@interface ViewController ()<WKScriptMessageHandler, WKNavigationDelegate, WKUIDelegate>
@property (nonatomic, strong) WKWebView *topView;
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UIProgressView *progressView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    //头部
    WKWebViewConfiguration *config = [WKWebView config:@"AppModel" target:self];

    CGRect frame=CGRectMake(0,20,self.view.bounds.size.width,88*[self ReSize]);
    self.topView = [[WKWebView alloc] initWithFrame:frame
                                      configuration:config];
    [self.topView setUrl:@"top" target:self];
    [self.view addSubview:self.topView];
    RequestH5 *get=[[RequestH5 alloc] init];
    [get get:@"http://192.168.1.139" target:self name:@"A"];
    RequestH5 *post=[[RequestH5 alloc] init];
    [post post:@"http://192.168.1.139" postStr:@"s=f&&q=t" target:self name:@"B"];
    //主框
    CGRect frameMain=CGRectMake(0,20+88*[self ReSize],self.view.bounds.size.width,self.view.bounds.size.height-(88*[self ReSize]));
    self.webView = [[WKWebView alloc] initWithFrame:frameMain
                                      configuration:config];
    [self.webView setUrl:@"index" target:self];
    [self.view addSubview:self.webView];
    //探测加载状态
    [self.webView addObserver:self
                   forKeyPath:@"loading"
                      options:NSKeyValueObservingOptionNew
                      context:nil];
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context {
    //加载状态有变化
    if ([keyPath isEqualToString:@"loading"]) {
        NSLog(@"loading");
    }
    
    // 加载完成
    if (!self.webView.loading) {
        //OC调JS
        [self.webView callJS:@"alertA(100)"];
    }
}
//替换alert
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    NSLog(@"%s", __FUNCTION__);
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"测试" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }]];
    
    [self presentViewController:alert animated:YES completion:NULL];
    NSLog(@"%@", message);
}
//JS向OC传值
#pragma mark - WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController
      didReceiveScriptMessage:(WKScriptMessage *)message {
    if ([message.name isEqualToString:@"AppModel"]) {
        // 打印所传过来的参数，只支持NSNumber, NSString, NSDate, NSArray,
        // NSDictionary, and NSNull类型
        NSLog(@"%@", message.body);
    }
}
//请求返回
-(void)getCallBack:(NSString *)name callBackJSON:(NSDictionary*)callback{
    NSLog(@"%@", name);
    NSLog(@"%@", callback);
};
@end
