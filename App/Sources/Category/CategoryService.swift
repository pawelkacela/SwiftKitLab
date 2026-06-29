//
//  CategoryService.swift
//  SwiftKitLab
//
//  Created by Pawel Kacela on 29/06/2026.
//

import Foundation
import Networking

protocol CategoryService {
    func fetch() async throws -> [String]
}

struct DefaultCategoryService: CategoryService {
    
    let baseURL: URL
    let client = APIClient()
        
    init(baseURL: URL = URL(string: "https://dummyjson.com")!
    ) {
        self.baseURL = baseURL
    }
    
    func fetch() async throws -> [String] {
        let endpoint = CategoryEndpoint()
        let request = try endpoint.makeRequest(baseURL: baseURL)
        
        return try await client.fetch(request: request,
                                      [String].self)
    }
    
}

