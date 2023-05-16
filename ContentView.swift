import SwiftUI

struct ContentView: View {
    
    @State var url = URL(string: "")
   
    @EnvironmentObject var SSearch: Search
    let pinnedStocks = [
           Stock(symbol: "APPL", price: 168.75),
           Stock(symbol: "MSFT", price: 305.66),
           Stock(symbol: "NVDA", price: 275.67)]

  
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                   
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
                  
                    
                }
                
                
                .foregroundColor(.blue)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading){
                        TextField("Search Stocks", text: $SSearch.search)
                            .textFieldStyle(.roundedBorder)
                            .frame(minWidth: 200, idealWidth: 270, maxWidth: 390)
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        NavigationLink("Search"){
                            StockView()
                        }
                        
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationLink {
                            NotificationView()
                        } label: {
                            Label("notification", systemImage: "bell")
                        }
                        
                    }
                    
                    
                    
                }
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
        }
        .navigationViewStyle(.stack)
        .foregroundColor(.cyan)
    }
}

