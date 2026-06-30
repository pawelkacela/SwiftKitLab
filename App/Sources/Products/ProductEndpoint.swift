//
//  ProductEndpoint.swift
//  SwiftKitLab
//
//  Created by Pawel Kacela on 29/06/2026.
//

import Foundation
import Networking

struct ProductEndpoint: Endpoint {
    
    let path: String = "/products"
    let method: HTTPMethod = .get
    
    var limit: Int
    var skip: Int
    
    var queryItems: [URLQueryItem] {
        let items: [URLQueryItem] = [
            URLQueryItem(name: "limit", value: "\(limit)"),
            URLQueryItem(name: "skip", value: "\(skip)")
        ]
        
        return items
    }
    
}
