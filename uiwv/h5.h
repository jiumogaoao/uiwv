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
@interface h5 : NSObject
@property (strong, nonatomic) NSNumber *diload;
-(id)init:(id)target frame:(CGRect)frameRect url:(NSString *)urlName callback:callbackName;
-(UIWebView *)getView;
-(void)call:(NSString *)js;
@end
