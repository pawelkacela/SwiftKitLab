//
//  Product.swift
//  AppDomain
//
//  Created by Pawel Kacela on 01/07/2026.
//

import Foundation

public struct Product: Identifiable {
    public let id: Int
    public let title: String
    public let price: Double
    public let thumbnail: String
    
    public init(id: Int,
                title: String,
                price: Double,
                thumbnail: String
    ) {
        self.id = id
        self.title = title
        self.price = price
        self.thumbnail = thumbnail
    }
}

extension Product: Sendable {
    public static let example = Product(id: 1, title: "Example", price: 10.0, thumbnail: "")
}
