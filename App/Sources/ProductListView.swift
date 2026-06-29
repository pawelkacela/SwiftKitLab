//
//  ProductListView.swift
//  SwiftKitLab
//
//  Created by Pawel Kacela on 29/06/2026.
//

import SwiftUI

struct ProductListView: View {
    
    let viewModel: ProductsViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.products) { product in
                Text(product.title)
            }
        }
        .overlay(content: {
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
        })
        .task {
            await viewModel.fetchProducts()
        }
    }
}

#Preview("sucess") {
    @State @Previewable var viewModel = ProductsViewModel(service: MockProductService())
    ProductListView(viewModel: viewModel)
}


#Preview("error") {
    @State @Previewable var viewModel = ProductsViewModel(service: MockProductService(error: .invalidResponse))
    ProductListView(viewModel: viewModel)
}
