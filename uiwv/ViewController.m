//
//  ViewController.m
//  uiwv
//
//  Created by 高志强 on 2016/12/1.
//  Copyright © 2016年 高志强. All rights reserved.
//

#import "ViewController.h"
#import "WKH5.h"
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
    CGRect frame=CGRectMake(0,0,self.view.bounds.size.width,100);
    self.topView = [[WKWebView alloc] initWithFrame:frame
                                      configuration:config];
    [self.topView setUrl:@"top" target:self];
    [self.view addSubview:self.topView];
    //主框
    CGRect frameMain=CGRectMake(0,100,self.view.bounds.size.width,self.view.bounds.size.height-100);
    self.webView = [[WKWebView alloc] initWithFrame:frameMain
                                      configuration:config];
    [self.webView setUrl:@"index" target:self];
    [self.view addSubview:self.webView];
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController
      didReceiveScriptMessage:(WKScriptMessage *)message {
    if ([message.name isEqualToString:@"AppModel"]) {
        // 打印所传过来的参数，只支持NSNumber, NSString, NSDate, NSArray,
        // NSDictionary, and NSNull类型
        NSLog(@"%@", message.body);
    }
}
@end
