//
//  ProductListView.swift
//  SwiftKitLab
//
//  Created by Pawel Kacela on 29/06/2026.
//

import SwiftUI
import AppDomain

struct ProductListView: View {
    
    let viewModel: ProductsViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.products) { product in
                
                Button {
                    viewModel.didSelectProduct(with: product.id)
                } label: {
                    ProductRow(product: product)
                        .padding(8)
                }
                    
            }
            .listRowSeparator(.hidden)
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



#Preview("Sucess") {
    @State @Previewable var viewModel = ProductsViewModel(service: MockProductService(),
                                                          router: Router())
    ProductListView(viewModel: viewModel)
}


#Preview("Error") {
    @State @Previewable var viewModel = ProductsViewModel(service: MockProductService(error: .invalidResponse),
                                                          router: Router())
    ProductListView(viewModel: viewModel)
}
