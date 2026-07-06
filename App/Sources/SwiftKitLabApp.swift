import SwiftUI

@main
struct SwiftKitLabApp: App {
    
    @State private var router = Router()
    
    var body: some Scene {
        WindowGroup {
            RootView(router: router)
        }
    }
}
