//
//  ExampleViews.swift
//  SwiftKitLab
//
//  Created by Pawel Kacela on 03/07/2026.
//

import Foundation
import SwiftUI

struct DetailView: View {
    
    var viewModel: DetailViewModel
    @Environment(Router.self) private var router
    
    var body: some View {
        VStack {
            
            Text("Detail \(viewModel.id)")
            
            DefaultButton("pop") {
                router.pop()
            }
            
            DefaultButton("popToRoot") {
                router.popToRoot()
            }
        }
    }
}

@MainActor
@Observable
final class DetailViewModel {
    
    let id: Int
    private let router: Router

    init(id: Int, router: Router) {
        self.id = id
        self.router = router
    }
    
}

struct HomeView: View {
    
    var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            
            Text("HomeView!")
                .font(.largeTitle)
                .padding(16)
            
            DefaultButton("Go to detail") {
                viewModel.didSelectItem()
            }
            
            DefaultButton("Products") {
                viewModel.didTapProducts()
            }
        }
    }
}

@MainActor
@Observable
final class HomeViewModel {
    
    private let router: Routing
    
    var items: [String] = ["a", "b"]

    init(router: Router) {
        self.router = router
    }
    
    func didTapProducts() {
        router.push(.productList)
    }

    func didSelectItem() {
        router.push(.detail(id: 1))
    }

}
