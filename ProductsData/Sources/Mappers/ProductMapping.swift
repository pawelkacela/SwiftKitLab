//
//  ProductMapping.swift
//  ProductsData
//
//  Created by Pawel Kacela on 02/07/2026.
//

import Foundation


import AppDomain
import ProductsAPI

extension Product {
    public func toDTO() -> ProductDTO {
        ProductDTO(id: id, title: title, price: price)
    }
}
