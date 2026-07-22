//
//  DefaultCategoryService.swift
//  ProductsData
//
//  Created by Pawel Kacela on 22/07/2026.
//

import Foundation
import AppDomain
import ProductsAPI
import Networking

public struct DefaultCategoryService: CategoryService {
    
    private let client: APIClient
    private let baseURL: URL
    
    public init(
        client: APIClient,
        baseURL: URL
    ) {
        self.client = client
        self.baseURL = baseURL
    }
    
    public func fetch() async throws -> [String] {
        let endpoint = ProductCategoriesEndpoint()
        let request = try endpoint.makeRequest(baseURL: baseURL)
        
        return try await client.fetch(request: request,
                                      [String].self)
    }
    
}
