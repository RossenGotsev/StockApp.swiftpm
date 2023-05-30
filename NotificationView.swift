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
    @State var notificationInterval = 0
    let timespan: [String] = [
        "every minute",
        "hourly",
        "daily",
        "weekly",
    ]
    @AppStorage("timespan") var selectedTimespan = ""
    
    var body: some View {
        
        NavigationView{
            VStack{
                Button("request permission"){
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            print("Permission granted")
                        } else if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                }
                
                Group{
                    VStack(spacing:1){
                        HStack(spacing:1){
                            Text("Recieve notifications")
                                .foregroundColor(.black)
                            Picker("Timespan of your notifications", selection: $selectedTimespan){
                                ForEach(timespan, id: \.self) { time in
                                    Text(time)
                                }
                               
                            }
                        }
                    }
                    .scaleEffect(1.3)
                    Button(action: {
                        UserDefaults.standard.set(selectedTimespan, forKey: "timespan")
                    }, label: {
                        Text("save")
                            .font(.largeTitle)
                            .frame(width: 100, height: 50)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    })
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [.white,.blue]), startPoint: .top, endPoint: .bottom))
        }
        .navigationViewStyle(.stack)
    }
}


