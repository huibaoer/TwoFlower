//
//  AppDelegate.m
//  TwoFlowerSelection_objc
//
//  Created by zhanght on 16/7/22.
//  Copyright © 2016年 zhanght. All rights reserved.
//

#import "AppDelegate.h"
#import "SelectVC.h"
#import "CouponsVC.h"
#import "CityVC.h"
#import "MineVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    
    [self.window makeKeyAndVisible];
    
    
    SelectVC *select = [[SelectVC alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:select];
    nav1.title = @"精选";
    
    CouponsVC *coupons = [[CouponsVC alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:coupons];
    nav2.title = @"优惠券";
    
    CityVC *city = [[CityVC alloc] init];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:city];
    nav3.title = @"同城";
    
    MineVC *mine = [[MineVC alloc] init];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:mine];
    nav4.title = @"我";
    
    UITabBarController *tab = [[UITabBarController alloc] init];
    tab.viewControllers = @[nav1, nav2, nav3, nav4];
    self.window.rootViewController = tab;
    
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

@end
