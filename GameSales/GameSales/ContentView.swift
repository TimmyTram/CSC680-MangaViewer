import SwiftUI

struct ContentView: View {
    
    
    //let gamerPowerService = GamerPowerService()
    
    var body: some View {
        VStack {
            Button("Click me") {
                fetchSales()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
