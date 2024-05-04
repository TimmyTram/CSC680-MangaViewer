import SwiftUI


struct GameDealDetailedView: View {
    
    @Binding
    var deal: GameDeal
    let frameWidth: CGFloat = 370
    let frameHeight: CGFloat = 500
    let frameRadius: CGFloat = 50
    let lineWidth: CGFloat = 10
    
    var body: some View {
        List() {
            // title
            Text(deal.title)
                .frame(width: (frameWidth + lineWidth), height: 50)
                .background(Color(hex: "66c0f4"))
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .listRowSeparator(.hidden)
                .listRowBackground(Color(hex: "2a475e"))
            
            // image
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .stroke(Color(hex: "66c0f4"), lineWidth: lineWidth)
                    .frame(width: frameWidth, height: (frameHeight * 0.415))
                AsyncImage(url: URL(string: deal.thumbnail)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                    case.failure:
                        Text("Unable to load Image")
                            .foregroundStyle(.white)
                    @unknown default: // supress compiler warnings
                        EmptyView()
                    }
                }
                .frame(width: frameWidth, height: (frameHeight * 0.5))
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color(hex: "2a475e"))
            
            
            VStack {
                Text("Type: \(deal.type)")
                    .foregroundStyle(.white)
                    .padding(5)
                Text("Worth: \(deal.worth)")
                    .foregroundStyle(.white)
                    .padding(5)
                Text("Platforms: \(deal.platforms)")
                    .foregroundStyle(.white)
                    .padding(5)
            }
            .frame(width: (frameWidth + lineWidth), height: (frameHeight * 0.3))
            .background(Color(hex: "1b2838"))
            .listRowSeparator(.hidden)
            .listRowBackground(Color(hex: "2a475e"))
            
            // Date
            VStack {
                Text("Publish Date: \(deal.published_date)")
                    .foregroundStyle(.white)
                    .padding(5)
                Text("End Date: \(deal.end_date)")
                    .foregroundStyle(.white)
                    .padding(5)
                Text("Status: \(deal.status)")
                    .foregroundStyle(.white)
                    .padding(5)
            }
            .frame(width: (frameWidth + lineWidth), height: (frameHeight * 0.3))
            .background(Color(hex: "1b2838"))
            .listRowSeparator(.hidden)
            .listRowBackground(Color(hex: "2a475e"))
            
            // description
            VStack {
                Text("About This Deal")
                    .foregroundStyle(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(deal.description)
                    .foregroundStyle(.white)
                    .padding(20)
            }
            .frame(width: (frameWidth + lineWidth), height: (frameHeight * 0.7))
            .background(Color(hex: "1b2838"))
            .listRowSeparator(.hidden)
            .listRowBackground(Color(hex: "2a475e"))
            
            
            // instructions
            VStack {
                Text("Instructions")
                    .foregroundStyle(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(deal.instructions)
                    .foregroundStyle(.white)
                    .padding(20)
                
                // Link to giveaway
                Link("Get Giveaway", destination: URL(string: deal.open_giveaway_url)!)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 5)
                    .background(Capsule()
                        .strokeBorder(Color.black, lineWidth: 0.8)
                        .background(Color.blue)
                        .clipped()
                    )
                    .clipShape(Capsule())
            }
            .frame(width: (frameWidth + lineWidth), height: (frameHeight * 0.7))
            .background(Color(hex: "1b2838"))
            .listRowSeparator(.hidden)
            .listRowBackground(Color(hex: "2a475e"))
            
            
        }
        .background(Color(hex: "2a475e"))
        .scrollContentBackground(.hidden)
    }
}

//https://stackoverflow.com/questions/76468134/how-to-create-a-swiftui-preview-in-xcode-15-for-a-view-with-a-binding
// Need this for easy editing of view
#Preview {
    struct PreviewWrapper: View {
        @State var value: GameDeal = GameDeal(id: 2837, title: "Orcs Must Die! 3 (Epic Games) Giveaway", worth: "$29.99", thumbnail: "https://www.gamerpower.com/offers/1/6633ab18b4e1e.jpg", image: "https://www.gamerpower.com/offers/1b/6633ab18b4e1e.jpg", description: "Get ready to unleash chaos for free with Orcs Must Die! 3 on the Epic Games Store! It's time to slice, dice your way through hordes of pesky orcs in this epic successor to the beloved Orcs Must Die! series. Prepare for a wild ride filled with laughter, strategy, and a whole lot of orc-slaying action. Claim your free copy now and show those repugnant orcs who's boss!", instructions: "1. Click the \"Get Giveaway\" button to visit the giveaway page.\r\n2. Login into your Epic Games Store account.\r\n3. Click the button to add the game to your library", open_giveaway_url: "https://www.gamerpower.com/open/orcs-must-die-3-epic-games-giveaway", published_date: "2024-05-02 11:02:48", platforms: "PC, Epic Games Store", end_date: "2024-05-09 23:59:00", users: 180, status: "Active", gamerpower_url: "https://www.gamerpower.com/orcs-must-die-3-epic-games-giveaway", open_giveaway: "https://www.gamerpower.com/open/orcs-must-die-3-epic-games-giveaway", type: "Game")
        
        var body: some View {
            GameDealDetailedView(deal: $value)
        }
    }
    return PreviewWrapper()
}
