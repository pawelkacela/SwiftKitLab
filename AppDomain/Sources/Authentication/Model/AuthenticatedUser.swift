//
//  AuthenticatedUser.swift
//  AppDomain
//
//  Created by Pawel Kacela on 12/08/2026.
//

import Foundation

public struct AuthenticatedUser: Equatable {

    public let id: Int
    public let username: String
    public let email: String
    public let firstName: String
    public let lastName: String
    public let image: String

    public init(
        id: Int,
        username: String,
        email: String,
        firstName: String,
        lastName: String,
        image: String
    ) {
        self.id = id
        self.username = username
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.image = image
    }
}
