//
//  ProductDTO.swift
//  AppDomain
//
//  Created by Pawel Kacela on 01/07/2026.
//

import Foundation
import Networking

public struct ProductDTO: Identifiable {
    public let id: Int
    public let title: String
    public let price: Double
}

extension ProductDTO: Sendable {
    static let example = ProductDTO(id: 1, title: "Example", price: 10.0)
}
