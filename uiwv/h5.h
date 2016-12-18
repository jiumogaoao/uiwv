//
//  h5.h
//  uiwv
//
//  Created by 高志强 on 2016/12/15.
//  Copyright © 2016年 高志强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
typedef void(^Block)(UIWebView* view);
@interface h5 : NSObject
-(id)init:(id)target frame:(CGRect)frameRect url:(NSString *)urlName callback:(Block)callbackName;
-(void)call:(NSString *)js;
@end
