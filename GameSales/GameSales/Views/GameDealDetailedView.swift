import SwiftUI


struct GameDealDetailedView: View {
    
    @Binding
    var paths: [Routes]
    
    @Binding
    var deal: GameDeal
    let frameWidth: CGFloat = 370
    let frameHeight: CGFloat = 500
    let frameRadius: CGFloat = 50
    let lineWidth: CGFloat = 10
    
    var body: some View {
        
        VStack {
            Button("") {
                // back to giveaway view
            }.navigationBarItems(
                leading: Image(systemName: "arrow.left.circle.fill").resizable().frame(width: 32, height: 32).onTapGesture {
                    paths.removeLast()
                }
            )
            
            List() {
                // title
                Text(deal.title)
                    .frame(width: (frameWidth - (lineWidth * 2)), height: 50)
                    .background(Color(hex: "66c0f4"))
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color(hex: "2a475e"))
                    .clipShape(RoundedRectangle(cornerRadius: frameRadius, style: .continuous))
                    
                
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
                .frame(width: (frameWidth - (lineWidth * 2)), height: (frameHeight * 0.3))
                .background(Color(hex: "1b2838"))
                .listRowSeparator(.hidden)
                .listRowBackground(Color(hex: "2a475e"))
                .clipShape(RoundedRectangle(cornerRadius: frameRadius, style: .continuous))
                
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
                .frame(width: (frameWidth - (lineWidth * 2)), height: (frameHeight * 0.3))
                .background(Color(hex: "1b2838"))
                .listRowSeparator(.hidden)
                .listRowBackground(Color(hex: "2a475e"))
                .clipShape(RoundedRectangle(cornerRadius: frameRadius, style: .continuous))
                
                // description
                VStack {
                    Text("About This Deal")
                        .foregroundStyle(.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text(deal.description)
                        .foregroundStyle(.white)
                        .padding(20)
                }
                .frame(width: (frameWidth - (lineWidth * 2)), height: (frameHeight * 0.7))
                .background(Color(hex: "1b2838"))
                .listRowSeparator(.hidden)
                .listRowBackground(Color(hex: "2a475e"))
                .clipShape(RoundedRectangle(cornerRadius: frameRadius, style: .continuous))
                
                
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
                .frame(width: (frameWidth - (lineWidth * 2)), height: (frameHeight * 0.7))
                .background(Color(hex: "1b2838"))
                .listRowSeparator(.hidden)
                .listRowBackground(Color(hex: "2a475e"))
                .clipShape(RoundedRectangle(cornerRadius: frameRadius, style: .continuous))
                
                
            }
            .background(Color(hex: "2a475e"))
            .scrollContentBackground(.hidden)
        }
    }
}
