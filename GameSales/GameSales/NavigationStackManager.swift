import SwiftUI


enum Routes {
    case list
    case details
}


// https://www.youtube.com/watch?v=j7l48K7fjz4
// Credits to this person for breaking down nav stack easily for me
struct NavigationStackManager: View {
    
    @State private var paths = [Routes]()
    
    // not a big fan of having to do this to pass around gameDeal around from view to view
    @State private var gameDeal: GameDeal = GameDeal(id: 0, title: "title", worth: "worth", thumbnail: "thumbnail", image: "image", description: "description", instructions: "instructions", open_giveaway_url: "open_giveaway_url", published_date: "published_date", platforms: "platforms", end_date: "end_date", users: 0, status: "status", gamerpower_url: "gamerpower_url", open_giveaway: "open_giveaway", type: "Game")
    
    var body: some View {
        NavigationStack(path: $paths) {
            GiveawayView(paths: $paths, gameDeal: $gameDeal).navigationDestination(for: Routes.self) { route in
                switch(route) {
                case .list:
                    GiveawayView(paths: $paths, gameDeal: $gameDeal)
                case .details:
                    GameDealDetailedView(paths: $paths, deal: $gameDeal).navigationBarBackButtonHidden(true)
                }
            }
        }
    }
    
    
    
}


//struct NavigationStackManager_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStackManager()
//    }
//}
