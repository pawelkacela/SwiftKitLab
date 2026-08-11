import AppDomain
import Testing
@testable import ProductsAPI
@testable import ProductsData

@Suite("Product mapping")
struct ProductMappingTests {

    @Test func apiModelMapsToDomainProduct() {
        let apiProduct = ProductAPIModel(
            id: 7,
            title: "Headphones",
            price: 129.5,
            thumbnail: "https://example.com/headphones.png"
        )

        let product = apiProduct.toDomain()

        #expect(product.id == 7)
        #expect(product.title == "Headphones")
        #expect(product.price == 129.5)
        #expect(product.thumbnail == "https://example.com/headphones.png")
    }
}
