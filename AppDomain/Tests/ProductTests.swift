import Testing
@testable import AppDomain

@Suite("Product")
struct ProductTests {

    @Test func storesProductDetails() {
        let product = Product(
            id: 42,
            title: "Mechanical Keyboard",
            price: 149.99,
            thumbnail: "https://example.com/keyboard.png"
        )

        #expect(product.id == 42)
        #expect(product.title == "Mechanical Keyboard")
        #expect(product.price == 149.99)
        #expect(product.thumbnail == "https://example.com/keyboard.png")
    }

    @Test func exampleProvidesStablePreviewData() {
        #expect(Product.example.id == 1)
        #expect(Product.example.title == "Example")
        #expect(Product.example.price == 10)
    }
}
