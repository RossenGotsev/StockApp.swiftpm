//
//  StockView.swift
//  StockApp
//
//  Created by Rossen Gotsev on 4/28/23.
//

import Foundation
import SwiftUI

struct StockView: View {
    
    var body: some View {
        NavigationView{
            VStack{
                
                Text("*Stock charts")
                Divider()
                Spacer()
                    .frame(height: 200)
                Text("*Stock prices, dividents, and other info")
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
      
    }
}
