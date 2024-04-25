import SwiftUI

struct ListDealView: View {
    
    let deals: [GameDeal]
    
    var body: some View {
        List {
            ForEach(deals, id: \.id) { deal in
                GameDealCardView(deal: deal)
            }
            .listRowSeparator(.hidden)
        }
        .scrollContentBackground(.hidden)
        
        
    }
}
