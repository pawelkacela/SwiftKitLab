import SwiftUI

@main
struct SwiftKitLabApp: App {
    var body: some Scene {
        WindowGroup {
            ProductListView(viewModel: ProductsViewModel())
        }
    }
}
