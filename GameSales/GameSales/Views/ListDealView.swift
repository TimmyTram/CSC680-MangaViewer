import SwiftUI

struct ListDealView: View {
    
    @Binding
    var paths: [Routes]
    
    @Binding
    var gameDeal: GameDeal
    
    let deals: [GameDeal]
    
    var body: some View {
        List {
            ForEach(deals, id: \.id) { deal in
                GameDealCardView(paths: $paths, gameDeal: $gameDeal, deal: deal)
            }
            .listRowSeparator(.hidden)
        }
        .scrollContentBackground(.hidden)
    }
}

let mock: [GameDeal] = [
    GameDeal(id: 1, title: "Overwatch", worth: "$39.99", thumbnail: "thumbnail", image: "image", description: "description", instructions: "instruction", open_giveaway_url: "open_giveaway_url", published_date: "published_date", platforms: "platforms", end_date: "end_date", users: 1, status: "status", gamerpower_url: "gamerpower_url", open_giveaway: "open_giveaway"),
    GameDeal(id: 2, title: "VALORANT", worth: "0", thumbnail: "", image: "thumbnail", description: "description", instructions: "instruction", open_giveaway_url: "open_giveaway_url", published_date: "published_date", platforms: "platforms", end_date: "end_date", users: 100, status: "status", gamerpower_url: "gamerpower_url", open_giveaway: "open_giveaway"),
    GameDeal(id: 3, title: "Strinova", worth: "0", thumbnail: "", image: "thumbnail", description: "description", instructions: "instruction", open_giveaway_url: "open_giveaway_url", published_date: "published_date", platforms: "platforms", end_date: "end_date", users: 100, status: "status", gamerpower_url: "gamerpower_url", open_giveaway: "open_giveaway"),
    GameDeal(id: 2837, title: "Orcs Must Die! 3 (Epic Games) Giveaway", worth: "$29.99", thumbnail: "https://www.gamerpower.com/offers/1/6633ab18b4e1e.jpg", image: "https://www.gamerpower.com/offers/1b/6633ab18b4e1e.jpg", description: "Get ready to unleash chaos for free with Orcs Must Die! 3 on the Epic Games Store! It's time to slice, dice your way through hordes of pesky orcs in this epic successor to the beloved Orcs Must Die! series. Prepare for a wild ride filled with laughter, strategy, and a whole lot of orc-slaying action. Claim your free copy now and show those repugnant orcs who's boss!", instructions: "1. Click the \"Get Giveaway\" button to visit the giveaway page.\r\n2. Login into your Epic Games Store account.\r\n3. Click the button to add the game to your library", open_giveaway_url: "https://www.gamerpower.com/open/orcs-must-die-3-epic-games-giveaway", published_date: "2024-05-02 11:02:48", platforms: "PC, Epic Games Store", end_date: "2024-05-09 23:59:00", users: 180, status: "Active", gamerpower_url: "https://www.gamerpower.com/orcs-must-die-3-epic-games-giveaway", open_giveaway: "https://www.gamerpower.com/open/orcs-must-die-3-epic-games-giveaway")
]

//struct ListDealView_preview: PreviewProvider {
//    static var previews: some View {
//        ListDealView(paths: .constant([]), deals: mock)
//            .previewLayout(.sizeThatFits)
//    }
//}
