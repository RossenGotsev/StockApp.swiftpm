import SwiftUI

struct ContentView: View {
    @State var StockSearch : String
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
                            TextField("Search Stocks", text: $StockSearch)
                                .textFieldStyle(.roundedBorder)
                                .frame(minWidth: 200, idealWidth: 290, maxWidth: 390, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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

