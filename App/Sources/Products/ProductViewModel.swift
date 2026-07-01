//
//  ProductViewModel.swift
//  SwiftKitLab
//
//  Created by Pawel Kacela on 28/06/2026.
//

import Foundation
import Networking

@Observable
class ProductsViewModel {
    
    var products: [Product]
    var errorMessage: String?
    var isLoading: Bool = false
    
    let service: ProductService
    
    init(products: [Product] = [],
         service: ProductService = DefaultProductService()
    ) {
        self.products = products
        self.service = service
    }
    
    func fetchProducts() async {
        
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



import Playgrounds

#Playground {
    let vm = ProductsViewModel()
    Task {
        await vm.fetchProducts()
    }
}
