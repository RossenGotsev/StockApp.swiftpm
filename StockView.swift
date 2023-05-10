//
//  StockView.swift
//  StockApp
//
//  Created by Rossen Gotsev on 4/28/23.
//

import Foundation
import SwiftUI




struct StockView: View {
    @State var StockPrice = ""
   @State var url = URL(string: "")
    @EnvironmentObject var SSearch: Search

    var body: some View {
        NavigationView{
            VStack{
                
                Text("*Stock charts")
                
                Divider()
                
                VStack{
                    ZStack{
                        
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: 100)
                            .foregroundColor(.blue)
                        Text("$\(StockPrice)")
                            .font(.largeTitle)
                    }
                }
                
               
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear{
               
                getPrice()
                
               
                    
            }
           

        }
      
    }
    
    
    func getPrice() {
        url=URL(string: "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=\(SSearch.search)&interval=5min&apikey=JUHAWMR1G46CJSY9")!
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let data = data {
                if let json = try? JSONSerialization.jsonObject(with: data) as? [String:Any] {
                    //    print(json)
                    guard let timeSeriesDictionary = json ["Time Series (5min)"] as? NSDictionary else {return}
                    
                    //print(timeSeriesDictionary["2023-05-09 20:00:00"])
                    guard let prices =  timeSeriesDictionary["2023-05-09 20:00:00"] as? NSDictionary else {return}
                    guard let stockPrice =  prices["4. close"] as? String else {return}
                    print(stockPrice)
                    DispatchQueue.main.async {
                        StockPrice = stockPrice
                    }
                    
                }
               
            }
        }
        .resume()
    }
}
