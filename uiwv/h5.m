//
//  h5.m
//  uiwv
//
//  Created by 高志强 on 2016/12/15.
//  Copyright © 2016年 高志强. All rights reserved.
//

#import "h5.h"

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
        _jsContext[@"gb"]=^(NSString* action,NSString* data){
    SEL func_selector = NSSelectorFromString([NSString stringWithFormat:@"%@:",action]);
    if ([callback respondsToSelector:func_selector]) {
        [callback performSelector:func_selector withObject:data];
    }
            
    };
     SEL callback_selector = NSSelectorFromString(callbackFn);
     if ([callback respondsToSelector:callback_selector]) {
     [callback performSelector:callback_selector];
     }

}


@end
