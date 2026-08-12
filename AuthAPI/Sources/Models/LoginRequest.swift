//
//  LoginRequest.swift
//  AuthAPI
//
//  Created by Pawel Kacela on 12/08/2026.
//

import Foundation

struct LoginRequest: Encodable {
    let username: String
    let password: String
}
