//
//  AppDelegate.swift
//  MyReminderApp
//
//  Created by たっくん on 2020/09/21.
//  Copyright © 2020 tatsuya.com. All rights reserved.
//

import UIKit
import UserNotifications
import NotificationCenter

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        sleep(2)
          //Notification登録前のおまじない。テストの為、現在のノーティフケーションを削除します
              UNUserNotificationCenter.current().removeAllPendingNotificationRequests();
              
              //Notification登録前のおまじない。これがないとpermissionエラーが発生するので必要です。
              UNUserNotificationCenter.current().requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in if granted {print("通知許可")}
              }
              
              //以下で登録処理
              let content = UNMutableNotificationContent()
              content.title = "防災アプリからのお知らせ";
              content.body = "災害への備えはできていますか？もう一度家族や友達ともう一度確認しましょう";
                content.sound = UNNotificationSound.default
            let date = DateComponents(day:1, hour:10, minute:16)
            let trigger = UNCalendarNotificationTrigger.init(dateMatching: date, repeats: true)
              let request = UNNotificationRequest.init(identifier: "TestNotification", content: content, trigger: trigger)
              let center = UNUserNotificationCenter.current()
              center.add(request)
              center.delegate = self
        return true
    }
    //上記のNotificatioを５秒後に受け取る関数
       //ポップアップ表示のタイミングで呼ばれる関数
       //（アプリがアクティブ、非アクテイブ、アプリ未起動,バックグラウンドでも呼ばれる）
       func userNotificationCenter(_ center: UNUserNotificationCenter,
                                   willPresent notification: UNNotification,
                                   withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
           completionHandler([.alert,.sound])
       }
           
     

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    


}


