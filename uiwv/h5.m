//
//  h5.m
//  uiwv
//
//  Created by 高志强 on 2016/12/15.
//  Copyright © 2016年 高志强. All rights reserved.
//

#import "h5.h"

@protocol JSObjcDelegate <JSExport>

- (void)action:(NSString *)actionName data:(NSString*)js;


@end
@interface h5 ()<UIWebViewDelegate>
{
    UIWebView *_webView;
    JSContext *_jsContext;
    NSString *_data;
    id callback;
    NSString *callbackFn;
}

@end
@implementation h5
-(id)init:(id)target frame:(CGRect)frameRect url:(NSString *)urlName callback:callbackName{
    callback = target;
    callbackFn = callbackName;
    self = [super init];
    _webView = [[UIWebView alloc] initWithFrame:frameRect];
    _webView.delegate = self;
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:urlName ofType:@"html"];
    NSURL *bundleUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    NSError *error = nil;
    
    NSData *htmlData = [[NSData alloc]  initWithContentsOfFile: htmlPath];
    
    if (error == nil) {//数据加载没有错误情况下
        [_webView loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8"baseURL: bundleUrl];
    }
    return self;
};
-(UIWebView *)getView{
    return _webView;
};
-(void)call:(NSString *)js{
    [_jsContext evaluateScript:js];
};
- (void)webViewDidFinishLoad:(UIWebView *)webView {
        _jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
        _jsContext[@"gb"]=^(NSString* a,NSString* b){
            NSLog(@"%@", a);
    };
     SEL func_selector = NSSelectorFromString(callbackFn);
     if ([callback respondsToSelector:func_selector]) {
     NSLog(@"回调成功...");
     [callback performSelector:func_selector];
     }else{
     NSLog(@"回调失败...");
     }

        /*_jsContext[@"gb"] = self;
        _jsContext.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue) {
            context.exception = exceptionValue;
            NSLog(@"error：%@", exceptionValue);
        };*/
}

#pragma mark - Web -> native

- (void)action:(NSString *)actionName data:(NSString*)js
{
    NSLog(@"%@",actionName);
   /* SEL func_selector = NSSelectorFromString(actionName);
    if ([callback respondsToSelector:func_selector]) {
        NSLog(@"回调成功...");
        [callback performSelector:func_selector];
        }else{
            NSLog(@"回调失败...");
            }*/
}
@end
