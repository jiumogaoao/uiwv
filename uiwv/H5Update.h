//
//  H5Update.h
//  iosUpdate
//
//  Created by 高志强 on 2017/1/4.
//  Copyright © 2017年 高志强. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^BlockVoid)(void);
@interface H5Update : NSObject
-(void) check:(BlockVoid)callBlack version:(NSNumber*)versionNumber;
@end
