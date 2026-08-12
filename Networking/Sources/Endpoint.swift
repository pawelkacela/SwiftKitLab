//
//  Endpoint.swift
//  SwiftKitLab
//
//  Created by Pawel Kacela on 29/06/2026.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

public protocol Endpoint {
    
    var path: String { get }
    var method: HTTPMethod { get }
    var queryItems: [URLQueryItem] { get }
    var headers: [String: String] { get }
    
    func makeRequest(baseURL: URL) throws -> URLRequest
}


public extension Endpoint {
    
    var headers: [String: String] {
        [:]
    }
    
    func makeRequest(baseURL: URL) throws -> URLRequest {
        
        var components = URLComponents(url: baseURL.appendingPathComponent(path),
                                       resolvingAgainstBaseURL: true)!
        
        components.queryItems = queryItems
        
        guard let url = components.url else {
            throw ApiError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addHeaders(headers)
        
        return request
    }
}

private extension URLRequest {
    mutating func addHeaders(_ headers: [String: String]) {
        for (field, value) in headers {
            setValue(value, forHTTPHeaderField: field)
        }
    }
}
