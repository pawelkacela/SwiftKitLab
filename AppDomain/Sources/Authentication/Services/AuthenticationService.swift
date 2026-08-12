//
//  AuthenticationService.swift
//  AppDomain
//
//  Created by Pawel Kacela on 12/08/2026.
//

import Foundation

public protocol AuthenticationService {
    func login(username: String, password: String) async throws -> AuthenticatedUser
}
