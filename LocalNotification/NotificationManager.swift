//
//  NotificationManager.swift
//  LocalNotification
//
//  Created by Cesar Rioja Garcia on 18/01/17.
//  Copyright © 2017 Cesar Rioja Garcia. All rights reserved.
//

import Foundation
import UserNotifications
import UIKit


class NotificationManager: NSObject {
    
    static var sharedNotificacionManager = NotificationManager()

    func registerUserNotification(){
        
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) {(accepted, error) in
                if !accepted {
                    print("Notification access denied.")
                }
            }
        } else {
            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil))
        }
    }
    
    
    
    func scheduleNotification(at date: Date, title: String, body: String) {
        
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents(in: .current, from: date)
        let newComponents = DateComponents(calendar: calendar, timeZone: .current, month: components.month, day: components.day, hour: components.hour, minute: components.minute)
        
        
        if #available (iOS 10, *){
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: newComponents, repeats: false)
            
            let content = UNMutableNotificationContent()
            content.title = title
            content.body = body
            content.sound = UNNotificationSound.default()
            
            let request = UNNotificationRequest(identifier: "textNotification", content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            UNUserNotificationCenter.current().add(request) {(error) in
                if let error = error {
                    print("Uh oh! We had an error: \(error)")
                }
            }
            
        }else{
            
            let notificaion = UILocalNotification()
            notificaion.alertBody = body
            notificaion.timeZone = NSTimeZone.local
            notificaion.fireDate = date
            UIApplication.shared.scheduleLocalNotification(notificaion)
            
        }
        
    }
    
    
    
    
}
