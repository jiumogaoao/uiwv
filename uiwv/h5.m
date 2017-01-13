//
//  h5.m
//  uiwv
//
//  Created by 高志强 on 2016/12/15.
//  Copyright © 2016年 高志强. All rights reserved.
//

#import "h5.h"

@interface h5 ()<UIWebViewDelegate>

@property (strong, nonatomic) UIWebView *webView;
@property (strong, nonatomic) JSContext *jsContext;
@property (strong, nonatomic) NSString *data;
@property (strong, nonatomic) id callback;
@property (strong, nonatomic) Block callbackFn;

@end
@implementation h5
-(id)init:(id)target frame:(CGRect)frameRect url:(NSString *)urlName callback:(Block)fn{
    self = [super init];
    self.callback = target;
    self.callbackFn = fn;
    self.webView = [[UIWebView alloc] initWithFrame:frameRect];
    self.webView.delegate = self;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dcoumentpath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    NSString *htmlPath = [NSString stringWithFormat:@"%@/h5/%@.html",dcoumentpath,urlName];
    NSURL *bundleUrl = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/h5",dcoumentpath]];
    NSError *error = nil;
    
    NSData *htmlData = [[NSData alloc]  initWithContentsOfFile: htmlPath];
    
    //if (error == nil) {//数据加载没有错误情况下
        [self.webView loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8"baseURL: bundleUrl];
    //}

    return self;
};
-(void)call:(NSString *)js{
    [self.jsContext evaluateScript:js];
};
- (void)webViewDidFinishLoad:(UIWebView *)webView {
        self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
        self.jsContext[@"ZTX"]=^(NSString* action,NSString* data){
    SEL func_selector = NSSelectorFromString([NSString stringWithFormat:@"%@:",action]);
    if ([self.callback respondsToSelector:func_selector]) {
        [self.callback performSelector:func_selector withObject:data];
    }
            
    };
    self.callbackFn(webView);
}


@end
