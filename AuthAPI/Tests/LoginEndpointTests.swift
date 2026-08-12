//
//  LoginEndpointTests.swift
//  AuthAPI
//
//  Created by Pawel Kacela on 12/08/2026.
//

import Foundation
import Networking
import Testing
@testable import AuthAPI

@Suite("Login endpoint")
struct LoginEndpointTests {

    @Test func requestMatchesLoginContract() throws {
        let endpoint = try LoginEndpoint(
            username: "emilys",
            password: "emilyspass"
        )
        let baseURL = try #require(URL(string: "https://example.com"))

        let request = try endpoint.makeRequest(baseURL: baseURL)

        #expect(request.httpMethod == "POST")
        #expect(request.url?.path == "/auth/login")
        #expect(
            request.value(forHTTPHeaderField: "Content-Type")
                == "application/json"
        )

        let body = try #require(request.httpBody)
        let json = try #require(
            JSONSerialization.jsonObject(with: body) as? [String: String]
        )

        #expect(json["username"] == "emilys")
        #expect(json["password"] == "emilyspass")
    }
}
