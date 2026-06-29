//
//  ProductService.swift
//  SwiftKitLab
//
//  Created by Pawel Kacela on 29/06/2026.
//

import Foundation
import Networking

protocol ProductService {
    func fetch(skip: Int, limit: Int) async throws -> [Product]
}

struct DefaultProductService: ProductService {
    
    let client = APIClient()
    
    func fetch(skip: Int, limit: Int) async throws -> [Product] {
        let url = URL(string: "https://dummyjson.com/products?limit=\(limit)&skip=\(skip)")
        let request = URLRequest(url: url!)
        
        return try await client.fetch(request: request, ProductsResponse.self).products
    }

}

struct MockProductService: ProductService {
    
    let error: ApiError?
    let result: [Product]
    
    init(error: ApiError? = nil,
         result: [Product] = [Product.example]
    ) {
        self.error = error
        self.result = result
    }
    
    func fetch(skip: Int, limit: Int) async throws -> [Product] {
        if let error {
            throw error
        } else {
            return result
        }
    }
}
