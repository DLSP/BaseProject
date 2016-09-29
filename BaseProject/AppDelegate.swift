//
//  AppDelegate.swift
//  BaseProject
//
//  Created by scott on 16/9/28.
//  Copyright © 2016年 scott. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

//MARK: 系统界面处理
extension AppDelegate{
    /**
     tabbar 字体色彩，图片色彩 (适用于纯色，如果有渐变和阴影，那么只能用选中和非选中两套图)
     */
    func settingTabbar(){
        //控制顶部状态栏
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        
        UITabBar.appearance().tintColor = UIColor.colorFromHex(0x1fa35f)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.colorFromHex(0x1fa35f)], for: UIControlState.normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.colorFromHex(0xe47a3c2)], for: UIControlState.selected)
    }
    
    /**
     navigationbar 阴影线
     */
    func settingNavigationBar(){
        let rect = CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: 2)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(UIColor.clear.cgColor)
        context.fill(rect)
        let theImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        UINavigationBar.appearance().shadowImage = theImage
    }
    
}

