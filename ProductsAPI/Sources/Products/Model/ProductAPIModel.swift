//
//  ProductAPIModel.swift
//  ProductsAPI
//
//  Created by Pawel Kacela on 02/07/2026.
//

import Foundation

public struct ProductAPIModel: Codable, Identifiable {
    public let id: Int
    public let title: String
    public let price: Double
}
