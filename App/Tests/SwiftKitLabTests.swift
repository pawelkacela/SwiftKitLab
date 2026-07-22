import Foundation
import Testing
@testable import SwiftKitLab
import AppDomain

@Suite("Products view model")
@MainActor
struct ProductsViewModelTests {

    @Test func initialLoadUsesServiceResult() async {
        let expected = [Product(id: 1, title: "Keyboard", price: 99)]
        let viewModel = ProductsViewModel(service: ProductServiceStub(result: .success(expected)))

        await viewModel.fetchProducts()

        #expect(viewModel.products.map(\.id) == expected.map(\.id))
        #expect(viewModel.errorMessage == nil)
        #expect(viewModel.isLoading == false)
    }

    @Test func initialLoadKeepsExistingProducts() async {
        let existing = [Product(id: 1, title: "Keyboard", price: 99)]
        let viewModel = ProductsViewModel(
            products: existing,
            service: ProductServiceStub(result: .success([]))
        )

        await viewModel.fetchProducts()

        #expect(viewModel.products.map(\.id) == existing.map(\.id))
    }

    @Test func loadingMoreAppendsServiceResult() async {
        let existing = [Product(id: 1, title: "Keyboard", price: 99)]
        let more = [Product(id: 2, title: "Mouse", price: 49)]
        let viewModel = ProductsViewModel(
            products: existing,
            service: ProductServiceStub(result: .success(more))
        )

        await viewModel.fetchMore()

        #expect(viewModel.products.map(\.id) == (existing + more).map(\.id))
        #expect(viewModel.errorMessage == nil)
    }

    @Test func loadFailureExposesLocalizedError() async {
        let viewModel = ProductsViewModel(
            service: ProductServiceStub(result: .failure(ProductServiceError.unavailable))
        )

        await viewModel.fetchProducts()

        #expect(viewModel.products.isEmpty)
        #expect(viewModel.errorMessage == "Products are unavailable.")
        #expect(viewModel.isLoading == false)
    }

}

private struct ProductServiceStub: ProductService {
    let result: Result<[Product], Error>

    func fetch(skip: Int, limit: Int) async throws -> [Product] {
        try result.get()
    }
}

private enum ProductServiceError: LocalizedError {
    case unavailable

    var errorDescription: String? {
        "Products are unavailable."
    }
}
