import Foundation

public struct HTTPClient {
    public init() {}

    public func get(url: URL) async throws -> Data {
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}
