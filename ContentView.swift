import SwiftUI

struct ContentView: View {
    
    @State var url = URL(string: "")
    @State var StockSearch = "IBM"
    let pinnedStocks = [
           Stock(symbol: "APPL", price: 168.75),
           Stock(symbol: "MSFT", price: 305.66),
           Stock(symbol: "NVDA", price: 275.67)]

  
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    Text("*Pinned Stocks")
                    List(pinnedStocks){ pinnedStocks in
                        HStack{
                            VStack{
                                Text(pinnedStocks.symbol)
                                Text("$\(pinnedStocks.price, specifier: "%.2f")")
                            }
                            Spacer()
                            Button {
                                
                            } label: {
                                Image(systemName: "pin.fill")
                                    .font(.title)
                            }
                        }
                    }
                    Spacer()
                    //                        .frame(height: 250)
                    Divider()
                    Text("*Big Movers")
                
                }
                
                
                    .foregroundColor(.blue)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading){   
                            TextField("Search Stocks", text: $StockSearch)
                                .textFieldStyle(.roundedBorder)
                                .frame(minWidth: 200, idealWidth: 290, maxWidth: 390)
                        }
                        ToolbarItem(placement: .navigationBarTrailing){
                            NavigationLink("Search"){
                                StockView()
                            }
                         
                        }
                        
                        
                        }
                
                
                    }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
        }
    }
}

