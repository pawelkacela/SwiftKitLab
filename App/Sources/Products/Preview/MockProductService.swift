import AppDomain
import Networking

struct MockProductService: ProductService {
    let error: ApiError?
    let result: [Product]

    init(
        error: ApiError? = nil,
        result: [Product] = [.example]
    ) {
        self.error = error
        self.result = result
    }

    func fetch(skip: Int, limit: Int) async throws -> [Product] {
        if let error {
            throw error
        }

        return result
    }
}
