//
//  AppDelegate.h
//  uiwv
//
//  Created by 高志强 on 2016/12/1.
//  Copyright © 2016年 高志强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

