//
//  AppDelegate.h
//  乐生活
//
//  Created by aDu on 16/1/25.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSHNavigationViewController, LSHRootViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) LSHNavigationViewController *navigationVC;
@property (nonatomic, strong) LSHRootViewController *rootVC;

@end

