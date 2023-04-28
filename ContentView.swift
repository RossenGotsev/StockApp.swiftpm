import SwiftUI

struct ContentView: View {
    let tempStocks = [
        Stock(symbol: "APPL", price: 168.75),
        Stock(symbol: "MSFT", price: 305.66),
        Stock(symbol: "NVDA", price: 275.67)]
    
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    Text("*Pinned Stocks")
                    
                    Spacer()
                        .frame(height: 250)
                    Divider()
                       
                    Text("*Big Movers")
                }
                
                
                    .foregroundColor(.blue)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading){   
                            TextField("Search Stocks", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                                .textFieldStyle(.roundedBorder)
                                .frame(minWidth: 200, idealWidth: 290, maxWidth: 390, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        ToolbarItem(placement: .navigationBarTrailing){
                            Button("News") {
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

