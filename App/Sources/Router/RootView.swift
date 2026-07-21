//
//  RootView.swift
//  SwiftKitLab
//
//  Created by Pawel Kacela on 03/07/2026.
//

import Foundation
import SwiftUI
import ProductsData
import Networking

struct RootView: View {
    
    @Bindable var router: Router
    private let dependencies: AppDependencies

    init(router: Router,
         dependencies: AppDependencies = .init()
    ) {
        self.router = router
        self.dependencies = dependencies
    }
    

    var body: some View {
        NavigationStack(path: $router.path) {
            HomeView(viewModel: HomeViewModel(router: router))
                .navigationDestination(for: Route.self) { route in
                    destination(for: route)
                }
        }
        .environment(router) // available to any child view via @Environment
    }

    @ViewBuilder
    private func destination(for route: Route) -> some View {
        switch route {
        case .detail(let id):
            DetailView(viewModel: DetailViewModel(id: id, router: router))
        case .productList:
            let vm = ProductsViewModel(service: dependencies.productService)
            ProductListView(viewModel: vm)
        }
    }
}
