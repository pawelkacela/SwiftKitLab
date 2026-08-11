import Foundation
import Testing
@testable import Networking

@Suite("Endpoint")
struct EndpointTests {

    @Test func createsRequestFromEndpointProperties() throws {
        let endpoint = TestEndpoint()
        let baseURL = try #require(URL(string: "https://example.com/api"))

        let request = try endpoint.makeRequest(baseURL: baseURL)

        #expect(request.httpMethod == "GET")
        #expect(request.url?.path == "/api/products")

        let requestURL = try #require(request.url)
        let components = try #require(URLComponents(url: requestURL, resolvingAgainstBaseURL: false))
        #expect(components.queryItems == [URLQueryItem(name: "limit", value: "10")])
    }
}

private struct TestEndpoint: Endpoint {
    let path = "products"
    let method = HTTPMethod.get
    let queryItems = [URLQueryItem(name: "limit", value: "10")]
}
