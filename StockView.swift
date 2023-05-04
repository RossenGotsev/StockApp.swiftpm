//
//  StockView.swift
//  StockApp
//
//  Created by Rossen Gotsev on 4/28/23.
//

import Foundation
import SwiftUI

var url = URL(string: "")

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
            .onAppear{
                url=URL(string: "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&apikey=JUHAWMR1G46CJSY9")!
                
                URLSession.shared.dataTask(with: url!) { (data, response, error) in
                    if let data = data {
                                        if let json = try? JSONSerialization.jsonObject(with: data) as? [String:Any] {
                                            print(json)
                                        }
                                    }

                }
                .resume()
                
                
               
                    
            }
            

        }
      
    }
}
