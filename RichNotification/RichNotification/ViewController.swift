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
    let categotyId = "categoryID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNotificationCategories()
        UNUserNotificationCenter.current().delegate = self
        
        createNotification(title: "Teste", subtitle: "testando", body: "Foi o Guimbo quem fez esse teste. <3")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setNotificationCategories(){
        let okAction = UNNotificationAction(identifier: "OK Action",
                                            title: "OK",
                                            options: [])
        let guimboAction = UNNotificationAction(identifier: "Guimbo Action",
                                                title: "Manda um oi pro Guimbo",
                                                options: [])
        
        let category = UNNotificationCategory(identifier: self.categotyId,
                                              actions: [okAction, guimboAction],
                                              intentIdentifiers: [],
                                              options: [.customDismissAction])
        UNUserNotificationCenter.current().setNotificationCategories([category])
    }
    
    func createNotification(title: String, subtitle: String, body: String) {
        let notification = UNMutableNotificationContent()
        notification.title = title
        notification.subtitle = subtitle
        notification.body = body
        notification.categoryIdentifier = categotyId
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        UNUserNotificationCenter.current().add(UNNotificationRequest.init(identifier: "Local Notification", content: notification, trigger: trigger), withCompletionHandler: nil)
    }
}
extension ViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let request = response.notification.request
        let requestID = request.identifier
        
        switch response.actionIdentifier {
        case "OK Action":
            print("Custom OK action triggered in background")
        case "Guimbo Action":
            print("Oi, Guimbo")
        case UNNotificationDefaultActionIdentifier:
            print("Default action triggered in background")
        default:
            print("Unknown action triggered in background, action identifier: \(response.actionIdentifier)")
        }
        
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [requestID])
        
        completionHandler()
    }
}

