//
//  WKH5.h
//  uiwv
//
//  Created by 高志强 on 2016/12/7.
//  Copyright © 2016年 高志强. All rights reserved.
//

#import <WebKit/WebKit.h>

@interface WKWebView (JavaScript)
-(void)setUrl:(NSString *)url target:(id)targetName;
+(WKWebViewConfiguration *)config:(NSString *)name target:(id)targetName;
@end
