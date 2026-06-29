//
//  ApiError.swift
//  Networking
//
//  Created by Pawel Kacela on 29/06/2026.
//


enum ApiError: Error {
    case invalidResponse
    case requestFailed(statusCode: Int, message: String?)
    case networkError(Error)
    case taskCancellation
}

struct ServerError: Decodable {
    let message: String
}
