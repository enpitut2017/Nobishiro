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
    
    
    var Hour: String = ""
    var Minute: String = ""
  
    
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
        
        //トリガーを設定
        
        let intHour: Int = Int(Hour)!
        let intMinute: Int = Int(Minute)!
        
        
        //表示の設定
        let content = UNMutableNotificationContent()
        content.title = "寝る時間ですよ"
        content.body = "寝るよな？"
        content.sound = UNNotificationSound.default()

    
        let time = DateComponents(hour:intHour, minute:intMinute)
     
        let trigger = UNCalendarNotificationTrigger.init(dateMatching: time, repeats: false)
        
        // デフォルトの通知。画像などは設定しない
        let request = UNNotificationRequest.init(identifier: "CalendarNotification", content: content, trigger: trigger)
        
        
        //通知を予約
            
        let center = UNUserNotificationCenter.current()
        center.add(request)
           
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
    
    

