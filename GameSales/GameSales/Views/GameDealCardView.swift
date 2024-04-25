import SwiftUI

struct GameDealCardView: View {
    
    let deal: GameDeal
    
    var body: some View {
        VStack {
            Text(deal.title)
            Text(deal.published_date)
        }
        .frame(width: 250, height: 400)
        .background(.red)
    }
}
