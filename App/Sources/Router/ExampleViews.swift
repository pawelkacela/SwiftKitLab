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
            Button("what") {
                router.push(.detail(id: 67))
            }
            
            Button("pop") {
                router.pop()
            }
            
            Button("popToRoot") {
                router.popToRoot()
            }
        }
    }
}

@Observable
class DetailViewModel {
    
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
            Button("Go to detail") {
                viewModel.didSelectItem()
            }
        }
    }
}

@Observable
class HomeViewModel {
    
    private let router: Routing
    
    var items: [String] = ["a", "b"]

    init(router: Router) {
        self.router = router
    }

    func didSelectItem() {
        router.push(.detail(id: 1))
    }

}
