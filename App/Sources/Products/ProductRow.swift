//
//  ProductRow.swift
//  SwiftKitLab
//
//  Created by Pawel Kacela on 22/07/2026.
//

import SwiftUI
import AppDomain

struct ProductRow: View {
    let product: Product
    var body: some View {
        VStack(alignment: .leading) {
            Text(product.title)
            Text("\(product.id)")
        }
        .padding(40)
    }
}

#Preview("ProductRow") {
    ProductRow(product: Product.example)
}
