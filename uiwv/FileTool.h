//
//  FileTool.h
//  uiwv
//
//  Created by 高志强 on 2017/1/23.
//  Copyright © 2017年 高志强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileTool : NSObject
-(void)get:(NSString *)path target:(id)targetObject callback:(NSString *)callbackName;
-(void)set:(NSString *)path data:(NSString *)dataStr target:(id)targetObject callback:(NSString *)callbackName;
@end
