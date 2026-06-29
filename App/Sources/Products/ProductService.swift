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
    let baseURL: URL
    
    init(baseURL: URL = URL(string: "https://dummyjson.com")!
    ) {
        self.baseURL = baseURL
    }
    
    func fetch(skip: Int, limit: Int) async throws -> [Product] {
        let endpoint = ProductEndpoint(limit: limit, skip: skip)
        let request = try endpoint.makeRequest(baseURL: baseURL)
        
        return try await client.fetch(request: request,
                                      ProductsResponse.self).products
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
