import SwiftUI


enum Routes {
    case list
    case details
}

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
