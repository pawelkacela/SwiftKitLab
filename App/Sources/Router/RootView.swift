//
//  RootView.swift
//  SwiftKitLab
//
//  Created by Pawel Kacela on 03/07/2026.
//

import Foundation
import SwiftUI

struct RootView: View {
    
    @Bindable var router: Router

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
        }
    }
}
