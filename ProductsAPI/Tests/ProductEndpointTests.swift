import Foundation
import Testing
@testable import ProductsAPI

@Suite("Product endpoint")
struct ProductEndpointTests {

    @Test func requestIncludesPathMethodAndPagination() throws {
        let endpoint = ProductEndpoint(limit: 20, skip: 40)
        let request = try endpoint.makeRequest(baseURL: #require(URL(string: "https://example.com")))

        #expect(request.httpMethod == "GET")
        #expect(request.url?.path == "/products")

        let requestURL = try #require(request.url)
        let components = try #require(URLComponents(url: requestURL, resolvingAgainstBaseURL: false))
        let queryItems = try #require(components.queryItems)
        #expect(queryItems.contains(URLQueryItem(name: "limit", value: "20")))
        #expect(queryItems.contains(URLQueryItem(name: "skip", value: "40")))
    }
}
