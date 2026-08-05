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
            
            AsyncImage(url: URL(string: product.thumbnail)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure:
                    Image(systemName: "camera")
                        .resizable()
                @unknown default:
                    Image(systemName: "camera")
                        .resizable()
                }
            }
            .font(.system(size: 26, weight: .semibold))
            .foregroundStyle(.primary)
            .frame(width: 80, height: 80)
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
