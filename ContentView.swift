import SwiftUI

struct ContentView: View {
    
    @State var url = URL(string: "")
    @State var StockSearch = "IBM"
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
                            NavigationLink("Search"){
                                StockView()
                            }
                            .onTapGesture {
                                url=URL(string: "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=\(StockSearch)&interval=5min&apikey=JUHAWMR1G46CJSY9")!
                            }
                        }
                        
                        
                        }
                
                
                    }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
            }
        }
    }

