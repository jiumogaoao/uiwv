//
//  getRequest.h
//  uiwv
//
//  Created by 高志强 on 2016/12/8.
//  Copyright © 2016年 高志强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WKH5.h"
@interface RequestH5 : NSObject

-(void)get:(NSString *)strURL
    target:(UIViewController*)targetObject
      name:(NSString *)nameString;
-(void)post:(NSString *)strURL
    postStr:(NSString*)postData
     target:(UIViewController*)targetObject
       name:(NSString *)nameString;
@end
