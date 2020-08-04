//
//  AppDelegate.swift
//  MyFund
//
//  Created by ZM on 2020/8/4.
//  Copyright © 2020 ZM. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        let nav: UINavigationController = UINavigationController.init(rootViewController: FundViewController())
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        return true
    }


}

