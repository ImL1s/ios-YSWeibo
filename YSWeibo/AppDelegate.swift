//
//  AppDelegate.swift
//  YSWeibo
//
//  Created by ImL1s on 2017/7/13.
//  Copyright © 2017年 ImL1s. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
//        // init root vc
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.rootViewController = MainViewController()
//        window?.makeKeyAndVisible()
//        
//        // init tab bar
        UITabBar.appearance().tintColor = UIColor.orange
        
        return true
    }
}

