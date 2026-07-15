//
//  DefaultProductService.swift
//  ProductsData
//
//  Created by Pawel Kacela on 02/07/2026.
//

import Foundation
import AppDomain
import ProductsAPI
import Networking


public final class DefaultProductService: ProductService {
    private let client: APIClient
    private let baseURL: URL
    
    public init(
        client: APIClient,
        baseURL: URL
    ) {
        self.client = client
        self.baseURL = baseURL
    }

    public func fetch(skip: Int, limit: Int) async throws -> [Product] {
        let endpoint = ProductEndpoint(limit: limit, skip: skip)
        let request = try endpoint.makeRequest(baseURL: baseURL)
        let response = try await client.fetch(request: request, ProductsResponse.self)
        return response.products.map { $0.toDomain() }
    }
}

public struct MockProductService: ProductService {
    
    let error: ApiError?
    let result: [Product]
    
    public init(error: ApiError? = nil,
         result: [Product] = [Product.example]
    ) {
        self.error = error
        self.result = result
    }
    
    public func fetch(skip: Int, limit: Int) async throws -> [Product] {
        if let error {
            throw error
        } else {
            return result
        }
    }
}


