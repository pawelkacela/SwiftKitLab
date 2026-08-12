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
    
    @Test func includesEndpointHeadersInRequest() throws {
        let endpoint = HeaderEndpoint()
        let baseURL = try #require(URL(string: "https://example.com"))
        
        let request = try endpoint.makeRequest(baseURL: baseURL)
        
        #expect(request.value(forHTTPHeaderField: "Content-Type") == "application/json")
        #expect(request.value(forHTTPHeaderField: "Accept") == "application/json")
    }
}

private struct TestEndpoint: Endpoint {
    let path = "products"
    let method = HTTPMethod.get
    let queryItems = [URLQueryItem(name: "limit", value: "10")]
}

private struct HeaderEndpoint: Endpoint {
    let path = "login"
    let method = HTTPMethod.post
    let queryItems: [URLQueryItem] = []

    let headers = [
        "Content-Type": "application/json",
        "Accept": "application/json"
    ]
}
