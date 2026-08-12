//
//  LoginResponseTests.swift
//  AuthAPI
//
//  Created by Pawel Kacela on 12/08/2026.
//

import Foundation
import Testing
@testable import AuthAPI

@Suite("Login response")
struct LoginResponseTests {

    @Test func decodesLoginResponse() throws {
        let data = Data(
            #"""
            {
                "id": 1,
                "username": "emilys",
                "email": "emily@example.com",
                "firstName": "Emily",
                "lastName": "Johnson",
                "image": "https://example.com/emily.png",
                "accessToken": "access-token",
                "refreshToken": "refresh-token"
            }
            """#.utf8
        )

        let response = try JSONDecoder().decode(
            LoginResponse.self,
            from: data
        )

        #expect(response.id == 1)
        #expect(response.username == "emilys")
        #expect(response.email == "emily@example.com")
        #expect(response.firstName == "Emily")
        #expect(response.lastName == "Johnson")
        #expect(response.image == "https://example.com/emily.png")
        #expect(response.accessToken == "access-token")
        #expect(response.refreshToken == "refresh-token")
    }
}
