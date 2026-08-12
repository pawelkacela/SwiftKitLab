//
//  LoginResponse.swift
//  AuthAPI
//
//  Created by Pawel Kacela on 12/08/2026.
//

import Foundation

public struct LoginResponse: Decodable {

    public let id: Int
    public let username: String
    public let email: String
    public let firstName: String
    public let lastName: String
    public let image: String
    public let accessToken: String
    public let refreshToken: String
}
