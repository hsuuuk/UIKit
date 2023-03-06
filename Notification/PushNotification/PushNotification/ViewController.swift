//
//  ViewController.swift
//  PushNotification
//
//  Created by 심현석 on 2023/02/14.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 알림 권한 요청
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if granted {
                print("알림 권한 허용")
            } else {
                print("알림 권한 거부")
            }
        }
    }
    
    @IBAction func tapped(_ sender: Any) {
        // 알림 발생
        let content = UNMutableNotificationContent()
        content.title = "푸쉬 알림"
        content.body = "발생했습니다."
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        
        let request = UNNotificationRequest(identifier: "testNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            print("알림 발생")
        }
    }
}

