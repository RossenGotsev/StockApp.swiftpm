//
//  StockView.swift
//  StockApp
//
//  Created by Rossen Gotsev on 4/28/23.
//

import Foundation
import SwiftUI

var url = URL(string: "")

var StockPrice = ""
struct StockView: View {
    
    var body: some View {
        NavigationView{
            VStack{
                
                Text("*Stock charts")
                Divider()
                Spacer()
                    .frame(height: 200)
                Text("*Stock prices, dividents, and other info")
                Text("\(StockPrice)")
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear{
                url=URL(string: "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&apikey=JUHAWMR1G46CJSY9")!
                
                URLSession.shared.dataTask(with: url!) { (data, response, error) in
                    if let data = data {
                                        if let json = try? JSONSerialization.jsonObject(with: data) as? [String:Any] {
                                          
                                            guard let timeSeriesDictionary = json ["Time Series (5min)"] as? NSDictionary else {return}

                                           //print(timeSeriesDictionary["2023-05-05 19:30:00"])
                                            guard let prices =  timeSeriesDictionary["2023-05-05 19:30:00"] as? NSDictionary else {return}
                                            guard let stockPrice =  prices["4. close"] as? String else {return}
                                       print(stockPrice)
                                           var StockPrice = stockPrice
                                        }
                        
                                    }
                   
                }
                .resume()
                
                
               
                    
            }
            

        }
      
    }
}
