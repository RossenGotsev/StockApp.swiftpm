//
//  StockView.swift
//  StockApp
//
//  Created by Rossen Gotsev on 4/28/23.
//

import Foundation
import SwiftUI

var url = URL(string: "")

struct LineGraph: Shape{
    var dataPoints: [Double]
    func path(in rect: CGRect) -> Path {
        
        func point(at ix: Int) -> CGPoint {
            let point = dataPoints[ix]
            let x = rect.width * Double(ix) / Double(dataPoints.count - 1)
            let y = (1 - point) * rect.height
            
            return CGPoint(x: x, y: y)
        }
        
        return Path{ p in
            guard dataPoints.count > 1 else {return}
            let start = dataPoints[0]
            p.move(to: CGPoint(x: 0, y: (1 - start) * rect.height))
            for idx in dataPoints.indices{
                p.addLine(to: point(at: idx))
            }
        }
    }
    
    
}


struct graph: View {
    @State var StockPrice = 0.0
    @State var StockPriceH = 0.0
    @State var StockPriceL = 0.0
   @State var url = URL(string: "")
    @EnvironmentObject var SSearch: Search
    var body: some View{
        HStack{
            
            VStack{
                LineGraph(dataPoints : StockView.oneMonth.normalized)
                    .stroke(Color.blue)
                    .frame(width:300, height: 280)
                    .border(Color.black)
                Text("last Hour")
            }
            VStack(spacing: 240){
                Text("$\(StockPriceH, specifier: "%.0f")")
                Text("$\(StockPriceL, specifier: "%.0f")")
                    .frame(height: 50 , alignment : .top)
                
                
               
            }
           
            
        }
        .onAppear{
            
            GetPrice()
            
            
            
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
                    let allData = timeSeriesDictionary.allValues
                    let number = allData.count
                    let number2 = number - 1
                    guard let prices =  allData[number2] as? NSDictionary else {return}
                    guard let stockPrice =  prices["4. close"] as? String else {return}
                    guard let stockPriceH =  prices["2. high"] as? String else {return}
                    guard let stockPriceL =  prices["3. low"] as? String else {return}
                    print(stockPrice)
                    DispatchQueue.main.async {
                        StockPrice = Double(stockPrice)!
                        StockPriceH = Double(stockPriceH)!
                        StockPriceL = Double(stockPriceL)!
                        
                    }
                    
                }
                
            }
        }
        .resume()
        
        
    }
}

extension Array where Element == Double {
    var normalized: [Double]{
        if let min = self.min(), let max = self.max() {
            return self.map { ($0 - min) / (max - min) }
        }
        return []
    }
}





struct StockView: View {
    @State var StockPrice = 0.0
    
    @State var url = URL(string: "")
    @EnvironmentObject var SSearch: Search
    @Binding var items: [ShoppingItem]
    @State var newItemName: String = ""
    @State var newItemQuantity: Double = 0.0
    @State var NewImageName = "pin"
    @State var pinToggle = false
    static var oneMonth: [Double] = []
   
    @State var SSprice3 = 0.0
   
    @State var SSprice4 = 0.0
    
    @State var SSprice5 = 0.0
  
    @State var SSprice6 = 0.0
    
    @State var SSprice7 = 0.0
  
    @State var SSprice8 = 0.0
    
    @State var SSprice9 = 0.0
    
    @State var SSprice10 = 0.0
   
    @State var SSprice11 = 0.0
    
    @State var SSprice12 = 0.0
   
    @State var SSprice13 = 0.0
    
    @State var SSprice14 = 0.0
   
    @State var SSprice15 = 0.0
    var body: some View {
        NavigationView{
            
            VStack{
                
                
                Text("\(SSearch.search)")
                    .font(.largeTitle)
                    .scaleEffect(1.3)
                
                Spacer()
                    .frame(height:100)
                
                
                graph()
                
                
                Divider()
                
                VStack{
                    ZStack{
                        
                        
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: 200)
                            .foregroundColor(.white)
                        Text("$\(StockPrice, specifier: "%.2f")")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .scaleEffect(2)
                    }
                }
                
                
                
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        let newItemName = SSearch.search
                        let newItemQuantity = StockPrice
                        let newItem = ShoppingItem(Name: newItemName, Quantity: newItemQuantity)
                        pinToggle.toggle()
                        
                        
                        
                        items.append(newItem)
                        self.newItemQuantity = 0.0
                        self.newItemName = ""
                    }label: {
                        Image(systemName: "\(NewImageName)")
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear{
                
            
                GetPrice()
                
                
                
            }
            
            
        }
        
        .navigationViewStyle(.stack)
    }
    
    
    func GetPrice() {
        url=URL(string: "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=\(SSearch.search)&interval=5min&apikey=JUHAWMR1G46CJSY9")!
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let data = data {
                if let json = try? JSONSerialization.jsonObject(with: data) as? [String:Any] {
                    print(json)
                    guard let timeSeriesDictionary = json ["Time Series (5min)"] as? NSDictionary else {return}
                    
                    //print(timeSeriesDictionary["2023-05-09 20:00:00"])
                    let allData = timeSeriesDictionary.allValues
                    let number = allData.count
                    let number2 = number - 1
                    guard let prices =  allData[number2] as? NSDictionary else {return}
                    guard let stockPrice =  prices["4. close"] as? String else {return}
                    guard let prices3 =  allData[number2-1] as? NSDictionary else {return}
                    guard let stockPrice3 =  prices3["4. close"] as? String else {return}
                    guard let prices4 =  allData[number2-2] as? NSDictionary else {return}
                    guard let stockPrice4 =  prices4["4. close"] as? String else {return}
                    guard let prices5 =  allData[number2-3] as? NSDictionary else {return}
                    guard let stockPrice5 =  prices5["4. close"] as? String else {return}
                    guard let prices6 =  allData[number2-4] as? NSDictionary else {return}
                    guard let stockPrice6 =  prices6["4. close"] as? String else {return}
                    guard let prices7 =  allData[number2-5] as? NSDictionary else {return}
                    guard let stockPrice7 =  prices7["4. close"] as? String else {return}
                    guard let prices8 =  allData[number2-6] as? NSDictionary else {return}
                    guard let stockPrice8 =  prices8["4. close"] as? String else {return}
                    guard let prices9 =  allData[number2-7] as? NSDictionary else {return}
                    guard let stockPrice9 =  prices9["4. close"] as? String else {return}
                    guard let prices10 =  allData[number2-8] as? NSDictionary else {return}
                    guard let stockPrice10 =  prices10["4. close"] as? String else {return}
                    guard let prices11 =  allData[number2-9] as? NSDictionary else {return}
                    guard let stockPrice11 =  prices11["4. close"] as? String else {return}
                    guard let prices12 =  allData[number2-10] as? NSDictionary else {return}
                    guard let stockPrice12 =  prices12["4. close"] as? String else {return}
                    guard let prices13 =  allData[number2-11] as? NSDictionary else {return}
                    guard let stockPrice13 =  prices13["4. close"] as? String else {return}
                    guard let prices14 =  allData[number2-12] as? NSDictionary else {return}
                    guard let stockPrice14 =  prices14["4. close"] as? String else {return}
                    guard let prices15 =  allData[number2-13] as? NSDictionary else {return}
                    guard let stockPrice15 =  prices15["4. close"] as? String else {return}
                    
                    print(stockPrice)
                    DispatchQueue.main.async {
                        StockPrice = Double(stockPrice)!
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
                        StockView.oneMonth.append(StockPrice)
                        StockView.oneMonth.append(SSprice3)
                        StockView.oneMonth.append(SSprice4)
                        StockView.oneMonth.append(SSprice5)
                        StockView.oneMonth.append(SSprice6)
                        StockView.oneMonth.append(SSprice7)
                        StockView.oneMonth.append(SSprice9)
                        StockView.oneMonth.append(SSprice10)
                        StockView.oneMonth.append(SSprice11)
                        StockView.oneMonth.append(SSprice12)
                        StockView.oneMonth.append(SSprice13)
                        StockView.oneMonth.append(SSprice14)
                        StockView.oneMonth.append(SSprice15)
                    }
                    
                }
                
            }
        }
        .resume()
        
        
    }
    
}
