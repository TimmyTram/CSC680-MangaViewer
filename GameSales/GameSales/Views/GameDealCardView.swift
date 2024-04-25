import SwiftUI

struct GameDealCardView: View {
    
    let deal: GameDeal
    
    var body: some View {
        VStack {
            Text(deal.title)
            Text(deal.published_date)
        }
        .frame(width: 300, height: 600)
        .background(Color(hex: "514bed"))
        .clipShape(RoundedRectangle(cornerRadius: 50))
    }
}
