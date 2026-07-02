//
//  ProductsResponse.swift
//  ProductsAPI
//
//  Created by Pawel Kacela on 02/07/2026.
//

import Foundation

public struct ProductsResponse: Codable {
   public let products: [Product]
   public let total: Int
   public let skip: Int
   public let limit: Int
}
