import SwiftUI

@main
struct MyApp: App {
    @StateObject  var SSearch = Search()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(SSearch)
        }
    }
}
