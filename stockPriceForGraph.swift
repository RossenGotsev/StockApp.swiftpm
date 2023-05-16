//
//  stockPriceForGraph.swift
//  StockApp
//
//  Created by Adam Kubala on 5/10/23.
//

import SwiftUI

struct chartData : View{
    @State var url = URL(string: "")
    @EnvironmentObject var SSearch: Search
    @State var StockPrice3 = ""
    @State var SSprice3 = 0.0
    @State var StockPrice4 = ""
    @State var SSprice4 = 0.0
    @State var StockPrice5 = ""
    @State var SSprice5 = 0.0
    @State var StockPrice6 = ""
    @State var SSprice6 = 0.0
    @State var StockPrice7 = ""
    @State var SSprice7 = 0.0
    @State var StockPrice8 = ""
    @State var SSprice8 = 0.0
    @State var StockPrice9 = ""
    @State var SSprice9 = 0.0
    @State var StockPrice10 = ""
    @State var SSprice10 = 0.0
    @State var StockPrice11 = ""
    @State var SSprice11 = 0.0
    @State var StockPrice12 = ""
    @State var SSprice12 = 0.0
    @State var StockPrice13 = ""
    @State var SSprice13 = 0.0
    @State var StockPrice14 = ""
    @State var SSprice14 = 0.0
    @State var StockPrice15 = ""
    @State var SSprice15 = 0.0
    static let oneMonth: [Double] = [4.3,5.0,6.9,10.7,9.3,7.4,9.9]
    @State var display = "?"
   
    
    var body: some View {
        VStack{
            Text("")
                .onAppear{ GetPrice()}
        }
        

    }
        
    
    func GetPrice() {
        url=URL(string: "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=\(SSearch.search)&interval=5min&apikey=JUHAWMR1G46CJSY9")!
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let data = data {
                if let json = try? JSONSerialization.jsonObject(with: data) as? [String:Any] {
                     print(json)
                    guard let timeSeriesDictionary = json ["Time Series (5min)"] as? NSDictionary else {return}
                    
                    //print(timeSeriesDictionary["2023-05-09 20:00:00"])
                   
                    guard let prices3 =  timeSeriesDictionary["2023-05-15 15:35:00"] as? NSDictionary else {return}
                    guard let stockPrice3 =  prices3["4. close"] as? String else {return}
                    guard let prices4 =  timeSeriesDictionary["2023-05-15 15:40:00"] as? NSDictionary else {return}
                    guard let stockPrice4 =  prices4["4. close"] as? String else {return}
                    guard let prices5 =  timeSeriesDictionary["2023-05-15 15:45:00"] as? NSDictionary else {return}
                    guard let stockPrice5 =  prices5["4. close"] as? String else {return}
                    guard let prices6 =  timeSeriesDictionary["2023-05-15 15:50:00"] as? NSDictionary else {return}
                    guard let stockPrice6 =  prices6["4. close"] as? String else {return}
                    guard let prices7 =  timeSeriesDictionary["2023-05-15 15:55:00"] as? NSDictionary else {return}
                    guard let stockPrice7 =  prices7["4. close"] as? String else {return}
                    guard let prices8 =  timeSeriesDictionary["2023-05-15 16:00:00"] as? NSDictionary else {return}
                    guard let stockPrice8 =  prices8["4. close"] as? String else {return}
                    guard let prices9 =  timeSeriesDictionary["2023-05-15 16:05:00"] as? NSDictionary else {return}
                    guard let stockPrice9 =  prices9["4. close"] as? String else {return}
                    guard let prices10 =  timeSeriesDictionary["2023-05-15 16:10:00"] as? NSDictionary else {return}
                    guard let stockPrice10 =  prices10["4. close"] as? String else {return}
                    guard let prices11 =  timeSeriesDictionary["2023-05-15 16:15:00"] as? NSDictionary else {return}
                    guard let stockPrice11 =  prices11["4. close"] as? String else {return}
                    guard let prices12 =  timeSeriesDictionary["2023-05-15 17:30:00"] as? NSDictionary else {return}
                    guard let stockPrice12 =  prices12["4. close"] as? String else {return}
                    guard let prices13 =  timeSeriesDictionary["2023-05-15 18:00:00"] as? NSDictionary else {return}
                    guard let stockPrice13 =  prices13["4. close"] as? String else {return}
                    guard let prices14 =  timeSeriesDictionary["2023-05-15 18:40:00"] as? NSDictionary else {return}
                    guard let stockPrice14 =  prices14["4. close"] as? String else {return}
                    guard let prices15 =  timeSeriesDictionary["2023-05-15 19:20:00"] as? NSDictionary else {return}
                    guard let stockPrice15 =  prices15["4. close"] as? String else {return}
                   
                    //print(stockPrice)
                    DispatchQueue.main.async {
//                        StockPrice3 = stockPrice3
//                        StockPrice4 = stockPrice4
//                        StockPrice5 = stockPrice5
//                        StockPrice6 = stockPrice6
//                        StockPrice7 = stockPrice7
//                        StockPrice8 = stockPrice8
//                        StockPrice9 = stockPrice9
//                        StockPrice10 = stockPrice10
//                        StockPrice11 = stockPrice11
//                        StockPrice12 = stockPrice12
//                        StockPrice13 = stockPrice13
//                        StockPrice14 = stockPrice14
//                        StockPrice15 = stockPrice15
                        SSprice3 = Double(stockPrice3)!
                        SSprice4 = Double(stockPrice4)!
                        SSprice5 = Double(stockPrice5)!
                        SSprice6 = Double(stockPrice6)!
                        SSprice7 = Double(stockPrice7)!
                        SSprice8 = Double(stockPrice8)!
                        SSprice9 = Double(stockPrice9)!
                        SSprice10 = Double(stockPrice10)!
                        SSprice11 = Double(stockPrice11)!
                        SSprice12 = Double(stockPrice12)!
                        SSprice13 = Double(stockPrice13)!
                        SSprice14 = Double(stockPrice14)!
                        SSprice15 = Double(stockPrice15)!
                    }
                    
                }
                
            }
        }
        .resume()
    }
}
