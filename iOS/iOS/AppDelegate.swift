//
//  AppDelegate.swift
//  iOS
//
//  Created by 聂高涛 on 2022/2/18.
//

import UIKit
@_exported import NXKit
@_exported import Flutter

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = EXAppViewController()
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

