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
       
                    List(items,id: \.self) { currentitem in
                        ItemView(currentitem: currentitem)
                            .listRowSeparator(.hidden, edges: .bottom)
                        HStack{
                            VStack{
                            
                            }
                        }
                    }
                  

                    Spacer()
                                            .frame(height: 250)
                    
//
                }
                
                
                .foregroundColor(.blue)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading){
                        TextField("Search Stocks", text: $SSearch.search)
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

