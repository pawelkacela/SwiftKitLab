//
//  LoginEndpoint.swift
//  AuthAPI
//
//  Created by Pawel Kacela on 12/08/2026.
//

import Foundation
import Networking

public struct LoginEndpoint: Endpoint {

    public let path = "auth/login"
    public let method = HTTPMethod.post
    public let queryItems: [URLQueryItem] = []
    public let headers = [
        "Content-Type": "application/json"
    ]
    public let body: Data?

    public init(
        username: String,
        password: String
    ) throws {
        
        let loginRequest = LoginRequest(
            username: username,
            password: password
        )

        body = try JSONEncoder().encode(loginRequest)
    }
}
