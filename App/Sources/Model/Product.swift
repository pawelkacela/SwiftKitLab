//
//  Product.swift
//  SwiftKitLab
//
//  Created by Pawel Kacela on 29/06/2026.
//


struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Double
}

extension Product {
    static let example = Product(id: 1, title: "Example", price: 10.0)
}
