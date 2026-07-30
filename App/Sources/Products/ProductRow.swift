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
        
        HStack {
            
            Image(systemName: "camera")
                .font(.system(size: 26, weight: .semibold))
                .foregroundStyle(.primary)
                .frame(width: 56, height: 56)
                .glassEffect(
                    .regular.tint(.blue.opacity(0.18)),
                    in: .rect(cornerRadius: 18)
                )
            
            VStack(alignment: .leading, spacing: 5) {
                Text(product.title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .lineLimit(1)

                Text("ID: \(product.id)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .monospacedDigit()
            }
            
            Spacer()

            Image(systemName: "chevron.right")
                .font(.footnote.weight(.semibold))
                .foregroundStyle(.tertiary)
        
        }
        .padding(16)
        .glassEffect(
            .regular.interactive(),
            in: .rect(cornerRadius: 24)
        )
        .contentShape(.rect(cornerRadius: 24))
        
    }
}

#Preview("ProductRow") {
    ProductRow(product: Product.example)
}
