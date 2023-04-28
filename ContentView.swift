import SwiftUI

struct ContentView: View {
    @State var StockSearch : String
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    Text("*Pinned Stocks")
                    List(pinnedStocks){ pinnedStocks in
                               VStack{
                                   Text(pinnedStocks.symbol)
                                   Text("$\(pinnedStocks.price, specifier: "%.2f")")
                               }
                           }
                    Spacer()
                        .frame(height: 250)
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
                            Button("Search") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                            }
                        }
                        
                        
                        }
                
                
                    }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
            }
        }
    }

