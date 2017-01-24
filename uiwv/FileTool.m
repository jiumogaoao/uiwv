//
//  FileTool.m
//  uiwv
//
//  Created by 高志强 on 2017/1/23.
//  Copyright © 2017年 高志强. All rights reserved.
//

#import "FileTool.h"

@implementation FileTool
-(void)get:(NSString *)path target:(id)targetObject callback:(NSString *)callbackName{
    NSFileManager *fm=[NSFileManager defaultManager];
    if([fm fileExistsAtPath:path]){
        NSData *fileData = [[NSData alloc] initWithContentsOfFile:path];
        SEL func_selector = NSSelectorFromString([NSString stringWithFormat:@"%@:",callbackName]);
        if ([targetObject respondsToSelector:func_selector]) {
            [targetObject performSelector:func_selector withObject:fileData];
        }
    }
};
-(void)set:(NSString *)path data:(NSData *)dataObject target:(id)targetObject callback:(NSString *)callbackName{
    NSFileManager *fm=[NSFileManager defaultManager];
    [fm removeItemAtPath:path error:nil];
    [fm createFileAtPath:path contents:dataObject attributes:nil];
    SEL func_selector = NSSelectorFromString([NSString stringWithFormat:@"%@:",callbackName]);
    NSString *fileData=@"";
    if ([targetObject respondsToSelector:func_selector]) {
        [targetObject performSelector:func_selector withObject:fileData];
    }};
@end
