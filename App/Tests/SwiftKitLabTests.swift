import Foundation
import Testing
@testable import SwiftKitLab
import AppDomain

@Suite("Products view model")
@MainActor
struct ProductsViewModelTests {

    @Test func initialLoadUsesServiceResult() async {
        let expected = [Product(id: 1, title: "Keyboard", price: 99, thumbnail: "keyboard.png")]
        let viewModel = ProductsViewModel(
            service: ProductServiceStub(result: .success(expected)),
            router: Router()
        )

        await viewModel.fetchProducts()

        #expect(viewModel.products.map(\.id) == expected.map(\.id))
        guard case .loaded = viewModel.loadingState else {
            Issue.record("Expected the view model to finish loading")
            return
        }
    }

    @Test func initialLoadKeepsExistingProducts() async {
        let existing = [Product(id: 1, title: "Keyboard", price: 99, thumbnail: "keyboard.png")]
        let viewModel = ProductsViewModel(
            products: existing,
            service: ProductServiceStub(result: .success([])),
            router: Router()
        )

        await viewModel.fetchProducts()

        #expect(viewModel.products.map(\.id) == existing.map(\.id))
    }

    @Test func loadingMoreAppendsServiceResult() async {
        let existing = [Product(id: 1, title: "Keyboard", price: 99, thumbnail: "keyboard.png")]
        let more = [Product(id: 2, title: "Mouse", price: 49, thumbnail: "mouse.png")]
        let viewModel = ProductsViewModel(
            products: existing,
            service: ProductServiceStub(result: .success(more)),
            router: Router()
        )

        await viewModel.fetchMore()

        #expect(viewModel.products.map(\.id) == (existing + more).map(\.id))
        guard case .loaded = viewModel.loadingState else {
            Issue.record("Expected the view model to finish loading more products")
            return
        }
    }

    @Test func loadFailureExposesLocalizedError() async {
        let viewModel = ProductsViewModel(
            service: ProductServiceStub(result: .failure(ProductServiceError.unavailable)),
            router: Router()
        )

        await viewModel.fetchProducts()

        #expect(viewModel.products.isEmpty)
        guard case .initialLoadError(let message) = viewModel.loadingState else {
            Issue.record("Expected an initial-load error")
            return
        }
        #expect(message == "Products are unavailable.")
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
