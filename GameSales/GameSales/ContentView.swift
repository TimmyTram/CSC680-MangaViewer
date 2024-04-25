import SwiftUI


enum RequestResult {
    case failure(Error)
    case success([GameDeal])
}

struct ContentView: View {
    
    
    let gamerPowerService: GamerPowerServiceProtocol = GamerPowerService()
    
    @State
    var output = "Empty"
    
    
    var body: some View {
        VStack {
            Button("Click me") {
                gamerPowerService.fetchSales(callback: { (result: RequestResult) -> Void in
                    switch result {
                    case . failure(let error):
                        output = error.localizedDescription
                    case .success(let gameDealArr):
                        let strings: [String] = gameDealArr.map { gameData in gameData.title }
                        output = strings.joined(separator: ", ")
                        print(strings)
                    }
                    
                })
            }
            Text(output)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
