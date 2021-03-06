//
//  AppDelegate.m
//  乐生活
//
//  Created by aDu on 16/1/25.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "AppDelegate.h"
#import "LSHNavigationViewController.h"
#import "LSHLoginViewController.h"
#import "LSHRootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [NSThread sleepForTimeInterval:1.0];
    [self.window makeKeyAndVisible];
    
    //登录
    if ([K_UserDefaults objectForKey:K_UserID]) {
        self.window.rootViewController = self.rootVC;
    } else {
        self.window.rootViewController = self.navigationVC;
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (LSHNavigationViewController *)navigationVC
{
    if (!_navigationVC) {
        LSHLoginViewController *loginVC = [[LSHLoginViewController alloc] init];
        _navigationVC = [[LSHNavigationViewController alloc] initWithRootViewController:loginVC];
    }
    return _navigationVC;
}

- (LSHRootViewController *)rootVC
{
    if (!_rootVC) {
        _rootVC = [[LSHRootViewController alloc] init];
    }
    return _rootVC;
}

@end
