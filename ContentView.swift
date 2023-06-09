import SwiftUI

struct ContentView: View {
    
    @State var url = URL(string: "")
    
    @EnvironmentObject var SSearch: Search
    //    let pinnedStocks = [
    //        Stock(symbol: "AAPL", price: 175.92),
    //           Stock(symbol: "MSFT", price: 319.40),
    //           Stock(symbol: "NVDA", price: 318.30)]
    
    @State var items:[ShoppingItem] = []
    
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    
                    Text(" Pinned Stocks:")
                        .font(
                            .system(size: 34)
                            .weight(.heavy)
                            
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
       
                    List{
                        ForEach(items,id: \.self) { currentitem in
                            ItemView(currentitem: currentitem)
                        }.onDelete  { indexSet in
                            items.remove(atOffsets: indexSet)
                        }
                        .listRowSeparator(.hidden,edges: .bottom)
                        HStack{
                            VStack{
                            
                            }
                        }
                    }
                  
                    
//
                }
                
                
                .foregroundColor(.blue)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading){
                        TextField("Search Ticker", text: $SSearch.search)
                            .disableAutocorrection(true)
                            .textFieldStyle(.roundedBorder)
                            .frame(minWidth: 200, idealWidth: 240, maxWidth: 700)

                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        NavigationLink("Search"){
                            StockView(items:$items)
                        }

                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationLink {
                            NotificationView(items: $items)
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

