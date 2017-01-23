//
//  NetworkTool.h
//  uiwv
//
//  Created by 高志强 on 2017/1/23.
//  Copyright © 2017年 高志强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface NetworkTool : NSObject
-(void)get:(NSString *)path target:(id)targetObject callback:(NSString *)callbackName;
-(void)post:(NSString *)path data:(NSMutableDictionary*)dataObject target:(id)targetObject callback:(NSString *)callbackName;
-(void)upLoad:(NSString *)path data:(NSMutableDictionary*)dataObject filePath:(NSString *)filePathName name:(NSString *)nameStr fileName:(NSString *)fileNameStr target:(id)targetObject callback:(NSString *)callbackName;
-(void)downLoad:(NSString *)path filePath:(NSString *)filePathName target:(id)targetObject callback:(NSString *)callbackName;
@end
