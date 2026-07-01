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
                ProductRow(product: product)
                    .padding(40)
                
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
        .onTriggerLoadAt(triggerDistance: 200, of: {
          Task {
                await viewModel.fetchMore()
            }
        })


    }
}

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

#Preview("API") {
    @State @Previewable var viewModel = ProductsViewModel(service: DefaultProductService())
    ProductListView(viewModel: viewModel)
}

#Preview("Sucess") {
    @State @Previewable var viewModel = ProductsViewModel(service: MockProductService())
    ProductListView(viewModel: viewModel)
}


#Preview("Error") {
    @State @Previewable var viewModel = ProductsViewModel(service: MockProductService(error: .invalidResponse))
    ProductListView(viewModel: viewModel)
}
