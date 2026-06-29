//
//  Endpoint.swift
//  SwiftKitLab
//
//  Created by Pawel Kacela on 29/06/2026.
//

import Foundation
import Networking

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

protocol Endpoint {
    
    var path: String { get }
    var method: HTTPMethod { get }
    var queryItems: [URLQueryItem] { get }
    
    func makeRequest(baseURL: URL) throws -> URLRequest
}


extension Endpoint {
    
    func makeRequest(baseURL: URL) throws -> URLRequest {
        
        var components = URLComponents(url: baseURL.appendingPathComponent(path),
                                       resolvingAgainstBaseURL: true)!
        
        components.queryItems = queryItems
        
        guard let url = components.url else {
            throw ApiError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return request
    }
}

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

struct CategoryEndpoint: Endpoint {
    
    let path: String = "/products/category-list"
    let method: HTTPMethod = .get
    var queryItems: [URLQueryItem] { [] }
    
}
