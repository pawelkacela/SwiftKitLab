//
//  ProductViewModel.swift
//  SwiftKitLab
//
//  Created by Pawel Kacela on 28/06/2026.
//

import Foundation
import AppDomain

@MainActor
@Observable
final class ProductsViewModel {
    
    enum LoadingState {
        case initial
        case loading
        case loadingMore
        case loaded
        case initialLoadError(String)
        case loadMoreError(String)
        
        var canLoad: Bool {
            switch self {
            case .initial, .loaded:
                true
            case .loading, .loadingMore, .initialLoadError, .loadMoreError:
                false
            }
        }
    }
    
    private(set) var products: [Product]
    private(set) var loadingState: LoadingState = .initial
    
    private let service: ProductService
    private let router: Routing
    
    init(products: [Product] = [],
         service: ProductService,
         router: Routing
    ) {
        self.products = products
        self.service = service
        self.router = router
    }
    
    func didSelectProduct(with ID: Int) {
        router.push(.detail(id: ID))
    }
    
    func fetchProducts() async {
        guard products.isEmpty, loadingState.canLoad else { return }
        loadingState = .loading
        
        do {
            self.products = try await service.fetch(skip: 0, limit: 10)
            loadingState = .loaded
        }
        catch {
            self.loadingState = .initialLoadError(error.localizedDescription)
        }
    }
    
    func fetchMore() async {
        guard loadingState.canLoad else { return }
        loadingState = .loadingMore
        
        do {
            let newProducts = try await service.fetch(skip: products.count, limit: 10)
            self.products.append(contentsOf: newProducts)
            loadingState = .loaded
        }
        catch {
            self.loadingState = .loadMoreError(error.localizedDescription)
        }
    }
    
}
