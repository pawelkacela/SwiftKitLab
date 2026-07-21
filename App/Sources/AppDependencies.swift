//
//  AppDependencies.swift
//  SwiftKitLab
//
//  Created by Pawel Kacela on 21/07/2026.
//

import AppDomain
import Networking
import ProductsData
import Foundation

struct AppDependencies {
    
    private static let apiClient = APIClient()
    private static let baseURL = URL(string: "https://dummyjson.com")!
    
    let productService: any ProductService = DefaultProductService(
        client: apiClient,
        baseURL: baseURL
    )
    
}
