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
    
    var products: [Product] = []
    let client = APIClient()
    
    func fetchProducts() async {
        
        // step 1
        let url = URL(string: "https://dummyjson.com/products?limit=10&skip=10&select=title,price")
        let request = URLRequest(url: url!)
        
        do {
            let productsResponse = try await client.fetch(request: request, ProductsResponse.self)
            self.products = productsResponse.products
            print("products: \(products.count)")
        }
        catch {
            print(error)
        }
        
    }
    
}


struct Product: Codable {
    let title: String
    let price: Double
}

struct ProductsResponse: Codable {
    let products: [Product]
    let total: Int
    let skip: Int
    let limit: Int
}


import Playgrounds

#Playground {
    let vm = ProductsViewModel()
    Task {
        await vm.fetchProducts()
    }
}
