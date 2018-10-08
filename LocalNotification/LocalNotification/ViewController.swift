//
//  ViewController.swift
//  LocalNotification
//
//  Created by Jully Nobre on 08/10/18.
//  Copyright © 2018 Jully Nobre. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createNotification(title: "Hehe", subtitle: "hehehe", body: "hehehehe")
        // Do any additional setup after loading the view, typically from a nib.
    }

    func createNotification(title: String, subtitle: String, body: String) {
        let notification = UNMutableNotificationContent()
        notification.title = title
        notification.subtitle = subtitle
        notification.body = body
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
        UNUserNotificationCenter.current().add(UNNotificationRequest.init(identifier: "Local Notification", content: notification, trigger: trigger), withCompletionHandler: nil)
    }
}

