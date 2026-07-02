//
//  ProductDTO.swift
//  AppDomain
//
//  Created by Pawel Kacela on 01/07/2026.
//

import Foundation

public struct ProductDTO: Identifiable {
    public let id: Int
    public let title: String
    public let price: Double
    
    public init(id: Int,
                title: String,
                price: Double
    ) {
        self.id = id
        self.title = title
        self.price = price
    }
}

extension ProductDTO: Sendable {
    public static let example = ProductDTO(id: 1, title: "Example", price: 10.0)
}
