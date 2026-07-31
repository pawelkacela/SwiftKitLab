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
    
    var products: [Product]
    var errorMessage: String?
    var isLoading: Bool = false
    
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
        guard isLoading == false else { return }
        guard products.isEmpty else { return }
        
        isLoading = true
        defer { isLoading = false }
        
        do {
            self.products = try await service.fetch(skip: 0, limit: 10)
        }
        catch {
            self.errorMessage = error.localizedDescription
        }
    }
    
    func fetchMore() async {
        guard isLoading == false else { return }
        isLoading = true
        defer { isLoading = false }
        
        do {
            let newProducts = try await service.fetch(skip: products.count, limit: 10)
            self.products.append(contentsOf: newProducts)
        }
        catch {
            self.errorMessage = error.localizedDescription
        }
    }
    
}
