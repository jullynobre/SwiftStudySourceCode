//
//  AppDelegate.swift
//  LocalNotification
//
//  Created by Jully Nobre on 08/10/18.
//  Copyright © 2018 Jully Nobre. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .alert]) { (sucsess, error) in
            if (error != nil) { print(error!) }
        }
        
        return true
    }
    
}

