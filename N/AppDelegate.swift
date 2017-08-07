//
//  AppDelegate.swift
//  N
//
//  Created by 碓氷隼也 on 2017/08/02.
//  Copyright © 2017年 碓氷隼也. All rights reserved.
//
import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    var window: UIWindow?
    
    var buttonChecker: Bool = false
    var hourChecker: Bool = false
    
    var Hour: String = ""
    var Minute: String = ""
    
    var NotificationHour: String = ""
  
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        if #available(iOS 10.0, *) {
            // iOS 10
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.badge, .sound, .alert], completionHandler: { (granted, error) in
                if error != nil {
                    return
                }
                
                if granted {
                    print("通知許可")
                    
                    let center = UNUserNotificationCenter.current()
                    center.delegate = self
                    
                } else {
                    print("通知拒否")
                }
            })
            
        } else {
            // iOS 9以下
            let settings = UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(settings)
        }
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        print(Hour)
        print(Minute)
        
        print(NotificationHour)
        
        //トリガーを設定
        
        let intHour: Int = Int(Hour)!
        let intMinute: Int = Int(Minute)!
        let intSecond: Int = 5
        
        let intNotificationHour: Int = Int(NotificationHour)!
        
        //寝させる通知内容の設定
        let titleText: String = "寝る時間ですよ"
        let bodyText: String  = "寝るよな？"
        let content = UNMutableNotificationContent()
        content.title = titleText
        content.body =  bodyText
        content.sound = UNNotificationSound.default()
        
        let center = UNUserNotificationCenter.current()

        //寝させる時間
        let id: String = "CalenderNotification"

        
        // 寝させる時間のセット
        if buttonChecker {
            
            // デフォルトの通知。画像などは設定しない
            var time = DateComponents(hour:intHour, minute:intMinute)
            var trigger = UNCalendarNotificationTrigger.init(dateMatching: time, repeats: false)
            
            var request = UNNotificationRequest.init(identifier: id, content: content, trigger: trigger)
            center.add(request)
            
            // 繰り返しの通知
            for idx in 1...5 {
                time = DateComponents(hour:intHour, minute:intMinute, second:intSecond*idx)
                trigger = UNCalendarNotificationTrigger.init(dateMatching: time, repeats: false)
                request = UNNotificationRequest.init(identifier: id + String(idx), content: content, trigger: trigger)
                center.add(request)
            }
        }
        else {
            center.removeAllPendingNotificationRequests()
        }
        
        //時間の設定し忘れを指摘する通知内容の設定
        let titleTextX: String = "今日は夜更かしするのですか？"
        let bodyTextX: String  = "寝る時間を決めませんか？"
        let contentX = UNMutableNotificationContent()
        contentX.title = titleTextX
        contentX.body =  bodyTextX
        contentX.sound = UNNotificationSound.default()
        
        let centerX = UNUserNotificationCenter.current()
        
        //設定をさせる方
        let idX: String = "CalenderNotificationX"
        
        
        if hourChecker {
        let timeX = DateComponents(hour:intNotificationHour, minute:10)
        let triggerX = UNCalendarNotificationTrigger.init(dateMatching: timeX, repeats: false)
        
        let requestX = UNNotificationRequest.init(identifier: idX, content: contentX, trigger: triggerX)
        centerX.add(requestX)
        } else {
            centerX.removeAllPendingNotificationRequests()
        }


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
    
    

