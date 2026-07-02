//
//  ProductService.swift
//  AppDomain
//
//  Created by Pawel Kacela on 01/07/2026.
//

import Foundation

public protocol ProductService {
    func fetch(skip: Int, limit: Int) async throws -> [ProductDTO]
}
