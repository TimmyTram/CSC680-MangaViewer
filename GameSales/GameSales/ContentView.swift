import SwiftUI


enum Loadable<T> {
    case loading
    case failure(Error)
    case success(T)
}

struct ContentView: View {
    
    let gamerPowerService: GamerPowerServiceProtocol = GamerPowerService()
    
    @State
    var screenState: Loadable<[GameDeal]> = .loading
    
    
    var body: some View {
        VStack {
            switch screenState {
            case .loading:
                ProgressView()
            case .failure(let error):
                Button("Retry") {
                    screenState = .loading
                    fetchGames()
                }
                Text(error.localizedDescription)
            case .success(let data):
                ListDealView(deals: data)
            }
        }
        .onAppear { fetchGames() }
    }
    
    func fetchGames() {
        gamerPowerService.fetchSales(callback: { (result: Loadable) -> Void in
            screenState = result
        })
    }
}




#Preview {
    ContentView()
}
