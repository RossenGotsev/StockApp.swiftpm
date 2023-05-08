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
    @State var selectedTimespan: String = ""
    var body: some View {
        
        NavigationView{
            VStack{
                Group{
               
                
                    Picker("Timespan of your notifications", selection: $selectedTimespan) {
                        ForEach(timespan, id: \.self) { time in
                            Text(time)
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
      
    }
}


