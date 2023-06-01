//
//  NotificationView.swift
//  StockApp
//
//  Created by Kazuya Nishizaka on 5/2/23.
//

import Foundation
import SwiftUI
import UserNotifications

struct NotificationView: View {
    @Binding var items: [ShoppingItem]
    var body: some View {
        
        NavigationView{
            VStack{
                Button("Request Permission") {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            print("All set!")
                        } else if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                    
                }
                
                Button("Schedule Notification") {
                    let content = UNMutableNotificationContent()
                    content.title = "Your stocks"
                   // content.subtitle = "\($items.Name) is at $\($items.Quantity)"
                    content.sound = UNNotificationSound.default

                    
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

            
                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                    
                    UNUserNotificationCenter.current().add(request)

                }
            }
            
        }
    }
}

