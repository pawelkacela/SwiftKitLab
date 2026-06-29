//
//  CategoryEndpoint.swift
//  SwiftKitLab
//
//  Created by Pawel Kacela on 29/06/2026.
//

import Foundation
import Networking

struct CategoryEndpoint: Endpoint {
    
    let path: String = "/products/category-list"
    let method: HTTPMethod = .get
    var queryItems: [URLQueryItem] { [] }
    
}
