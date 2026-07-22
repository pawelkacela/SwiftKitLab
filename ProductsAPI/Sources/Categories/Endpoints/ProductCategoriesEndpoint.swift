//
//  ProductCategoriesEndpoint.swift
//  ProductsAPI
//
//  Created by Pawel Kacela on 22/07/2026.
//

import Foundation
import Networking

public struct CategoryEndpoint: Endpoint {
    
    public let path: String = "/products/category-list"
    public let method: HTTPMethod = .get
    public var queryItems: [URLQueryItem] { [] }
    
    public init() { }
    
}
