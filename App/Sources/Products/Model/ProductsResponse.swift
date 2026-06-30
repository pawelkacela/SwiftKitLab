//
//  ProductsResponse.swift
//  SwiftKitLab
//
//  Created by Pawel Kacela on 29/06/2026.
//


struct ProductsResponse: Codable {
    let products: [Product]
    let total: Int
    let skip: Int
    let limit: Int
}
