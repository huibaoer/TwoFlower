//
//  AppDelegate.swift
//  TwoFlowerSelection
//
//  Created by zhanght on 16/6/1.
//  Copyright © 2016年 zhanght. All rights reserved.
//

import UIKit
//import MainViewController
//import CouponsViewController
//import CityViewController
//import MineViewController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.backgroundColor = UIColor.whiteColor()
        
        let main = MainViewController()
        let nav1 = UINavigationController(rootViewController: main)
        nav1.title = "精选"
        let coupons = CouponsViewController()
        let nav2 = UINavigationController(rootViewController: coupons)
        nav2.title = "优惠券"
        let city = CityViewController()
        let nav3 = UINavigationController(rootViewController: city)
        nav3.title = "同城"
        let mine = MineViewController()
        let nav4 = UINavigationController(rootViewController: mine)
        nav4.title = "我"
        
        let tab = UITabBarController()
        tab.viewControllers = [nav1, nav2, nav3, nav4]
        
        self.window?.rootViewController = tab
        
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

