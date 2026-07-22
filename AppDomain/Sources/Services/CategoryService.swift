//
//  CategoryService.swift
//  AppDomain
//
//  Created by Pawel Kacela on 22/07/2026.
//

import Foundation

public protocol CategoryService {
    func fetch() async throws -> [String]
}
