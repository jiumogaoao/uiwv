//
//  WKH5.m
//  uiwv
//
//  Created by 高志强 on 2016/12/7.
//  Copyright © 2016年 高志强. All rights reserved.
//

#import "WKH5.h"

@implementation WKWebView (JavaScript)

-(void)setUrl:(NSString *)url target:(id)targetName{
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:url ofType:@"html"];
    NSURL *htmlURL=[NSURL fileURLWithPath:htmlPath];
    [self loadFileURL:htmlURL allowingReadAccessToURL:htmlURL];
    // 导航代理
    self.navigationDelegate = targetName;
    // 与webview UI交互代理
    self.UIDelegate = targetName;

};
+(WKWebViewConfiguration *)config:(NSString *)name target:(id)targetName{
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    // 设置偏好设置
    config.preferences = [[WKPreferences alloc] init];
    // 默认为0
    config.preferences.minimumFontSize = 10;
    // 默认认为YES
    config.preferences.javaScriptEnabled = YES;
    // 在iOS上默认为NO，表示不能自动通过窗口打开
    config.preferences.javaScriptCanOpenWindowsAutomatically = NO;
    // web内容处理池
    config.processPool = [[WKProcessPool alloc] init];
    
    // 通过JS与webview内容交互
    config.userContentController = [[WKUserContentController alloc] init];
    // 注入JS对象名称AppModel，当JS通过AppModel来调用时，
    // 我们可以在WKScriptMessageHandler代理中接收到
    [config.userContentController addScriptMessageHandler:targetName name:name];
    // web内容处理池
    config.processPool = [[WKProcessPool alloc] init];
    return config;
};
@end
