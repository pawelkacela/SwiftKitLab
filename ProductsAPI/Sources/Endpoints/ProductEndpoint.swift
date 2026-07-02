//
//  ProductEndpoint.swift
//  ProductsAPI
//
//  Created by Pawel Kacela on 02/07/2026.
//

import Foundation
import Networking

public struct ProductEndpoint: Endpoint {
    
    public let path: String = "/products"
    public let method: HTTPMethod = .get
    
    public var limit: Int
    public var skip: Int
    
    public var queryItems: [URLQueryItem] {
        let items: [URLQueryItem] = [
            URLQueryItem(name: "limit", value: "\(limit)"),
            URLQueryItem(name: "skip", value: "\(skip)")
        ]
        
        return items
    }
    
    public init(limit: Int, 
                skip: Int
    ) {
        self.limit = limit
        self.skip = skip
    }
}

