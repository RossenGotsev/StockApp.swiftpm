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
        url=URL(string: "https://query1.finance.yahoo.com/v6/finance/quote?symbols=\(SSearch.search)")!
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let data = data {
                if let json = try? JSONSerialization.jsonObject(with: data) as? [String:Any] {
                    print(json)
                    guard let timeSeriesDictionary = json ["quoteResponse"] as? NSDictionary else {return}
                    
//                    print(timeSeriesDictionary)
                    guard let prices =  timeSeriesDictionary["result"] as? NSArray else {return}
                    //print(prices[0])
                    guard let Sprice =  prices[0] as? NSDictionary else {return}
                    //print(Sprice["ask"]!)
                    guard let stockPrice =  Sprice["ask"] as? Double else {return}
                   
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
    @State var StockName = ""
   @State var url = URL(string: "")
    @EnvironmentObject var SSearch: Search
    @Binding var items: [ShoppingItem]
    @State var newItemName: String = ""
    @State var newItemQuantity: Double = 0.0
    @State var NewImageName = "pin"
    @State var pinToggle = false
    var body: some View {
        NavigationView{
            
            VStack{
                Text("\(StockName)")

                Text("\(StockName)")
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
                
            
                getPrice()
                
                
                
            }
            
            
        }
        
        .navigationViewStyle(.stack)
    }
    
    
    func getPrice() {
        url=URL(string: "https://query1.finance.yahoo.com/v6/finance/quote?symbols=\(SSearch.search)")!
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let data = data {
                if let json = try? JSONSerialization.jsonObject(with: data) as? [String:Any] {
                    print(json)
                    guard let timeSeriesDictionary = json ["quoteResponse"] as? NSDictionary else {return}

//                   print(timeSeriesDictionary)
                    guard let prices =  timeSeriesDictionary["result"] as? NSArray else {return}
                    //print(prices[0])
                    guard let Sprice =  prices[0] as? NSDictionary else {return}
                    //print(Sprice["ask"]!)
                    guard let stockPrice =  Sprice["ask"] as? Double else {return}
                    guard let stockName =  Sprice["displayName"] as? String else {return}
                    print(stockPrice)
                    DispatchQueue.main.async {
                        StockPrice = stockPrice
                        StockName = stockName
                    }
                    
                }
                
            }
        }
        .resume()
        
    }
    
}
