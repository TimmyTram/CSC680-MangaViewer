import SwiftUI


enum Routes {
    case list
    case details
}


// https://www.youtube.com/watch?v=j7l48K7fjz4
// Credits to this person for breaking down nav stack easily for me
struct NavigationStackManager: View {
    
    @State private var paths = [Routes]()
    
    var body: some View {
        NavigationStack(path: $paths) {
            ContentView(paths: $paths).navigationDestination(for: Routes.self) { route in
                switch(route) {
                case .list:
                    ContentView(paths: $paths)
                case .details:
                    GameDealDetailedView()
                }
            }
        }
    }
}


struct NavigationStackManager_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackManager()
    }
}
