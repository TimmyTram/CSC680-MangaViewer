import SwiftUI


struct GameDealDetailedView: View {
    
    @Binding
    var deal: GameDeal
    
    var body: some View {
        VStack {
            Text("Hello from Game Deal Detailed View!")
            Text(deal.title)
        }
    }
}




//struct GameDealDetailedView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameDealDetailedView()
//    }
//}
