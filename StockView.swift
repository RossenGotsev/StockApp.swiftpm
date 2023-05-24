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
   @State var url = URL(string: "")
    @EnvironmentObject var SSearch: Search
    var body: some View{
        HStack{
            
            VStack{
                LineGraph(dataPoints : chartData.oneMonth.normalized)
                    .stroke(Color.blue)
                    .frame(width:300, height: 280)
                    .border(Color.black)
                Text("last Hour")
            }
            VStack(spacing: 80){
                Text("$\(StockPrice, specifier: "%.0f")")
                Text("$\(StockPrice-5, specifier: "%.0f")")
                Text("$\(StockPrice-10, specifier: "%.0f")")
            }
            .onAppear{
               
                GetPrice()
                
               
                    
            }
            
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
                    guard let prices =  timeSeriesDictionary["2023-05-19 18:50:00"] as? NSDictionary else {return}
                    guard let stockPrice =  prices["4. close"] as? String else {return}
                    print(stockPrice)
                    DispatchQueue.main.async {
                        StockPrice = Double(stockPrice)!
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
    
    var body: some View {
        NavigationView{
            
            VStack{
                
                Button{
                    let newItemName = SSearch.search
                    let newItemQuantity = StockPrice
                    let newItem = ShoppingItem(Name: newItemName, Quantity: newItemQuantity)
                                    
                                    items.append(newItem)
                    self.newItemQuantity = 0.0
                    self.newItemName = ""
                }label: {
                    Image(systemName: "pin")
                }
                .offset(x: 150, y: 10)

                Text("\(SSearch.search)")
                    .font(.largeTitle)
                    .scaleEffect(2)
            
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
          
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear{
               
                getPrice()
                
               
                    
            }
           
            
        }
        
        .navigationViewStyle(.stack)
    }
    
    
    func getPrice() {
        url=URL(string: "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=\(SSearch.search)&interval=5min&apikey=JUHAWMR1G46CJSY9")!
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let data = data {
                if let json = try? JSONSerialization.jsonObject(with: data) as? [String:Any] {
                        print(json)
                    guard let timeSeriesDictionary = json ["Time Series (5min)"] as? NSDictionary else {return}
                    
                    //print(timeSeriesDictionary["2023-05-09 20:00:00"])
                    guard let prices =  timeSeriesDictionary["2023-05-19 18:50:00"] as? NSDictionary else {return}
                    guard let stockPrice =  prices["4. close"] as? String else {return}
                    //print(stockPrice)
                    DispatchQueue.main.async {
                        StockPrice = Double(stockPrice)!
                    }
                    
                }
               
            }
        }
        .resume()
        
    }
    
}
