//
//  NotificationView.swift
//  StockApp
//
//  Created by Kazuya Nishizaka on 5/2/23.
//

import Foundation
import SwiftUI

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
                Group{
                    VStack(spacing:1){
                        HStack(spacing:1){
                            Text("Recieve notifications")
                                
                            Picker("Timespan of your notifications", selection: $selectedTimespan){
                                ForEach(timespan, id: \.self) { time in
                                    Text(time)
                                }
                               
                            }
                        }
                    }
                    .scaleEffect(1.6)
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
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .navigationViewStyle(.stack)
    }
}


