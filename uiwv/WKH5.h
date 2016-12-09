//
//  WKH5.h
//  uiwv
//
//  Created by 高志强 on 2016/12/7.
//  Copyright © 2016年 高志强. All rights reserved.
//

#import <WebKit/WebKit.h>
#import <UIKit/UIKit.h>

@interface WKWebView (JavaScript)
-(void)setUrl:(NSString *)url
       target:(id)targetName;
-(void)callJS:(NSString *)fn;
+(WKWebViewConfiguration *)config:(NSString *)name
                           target:(id)targetName;
@end

@interface UIViewController (JavaScript)
-(void)getCallBack:(NSString *)name
      callBackJSON:(NSDictionary*)callback;
-(CGFloat)ReSize;
@end
