//
//  ApiError.swift
//  Networking
//
//  Created by Pawel Kacela on 29/06/2026.
//

import Foundation

public enum ApiError: Error, LocalizedError {
    case invalidResponse
    case requestFailed(statusCode: Int, message: String?)
    case networkError(Error)
    case taskCancellation
    
    public var errorDescription: String? {
        switch self {
        case .invalidResponse:
            "Invalid response"
        case .requestFailed(statusCode: let statusCode, message: let message):
            "Request failed with status code: \(statusCode). \(message ?? "")"
        case .networkError(let error):
            error.localizedDescription
        case .taskCancellation:
            "Request was cancelled"
        }
    }
}

struct ServerError: Decodable {
    let message: String
}
