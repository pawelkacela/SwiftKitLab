import Testing
@testable import SwiftKitLab

@Suite("Router")
@MainActor
struct RouterTests {

    @Test func pushAddsRouteToPath() {
        let router = Router()

        router.push(.detail(id: 42))

        #expect(router.path.count == 1)
    }

    @Test func popDoesNotRemoveBeyondRoot() {
        let router = Router()
        router.push(.detail(id: 1))

        router.pop()
        router.pop()

        #expect(router.path.isEmpty)
    }

    @Test func popCountIsBoundedByPathLength() {
        let router = Router()
        router.push(.detail(id: 1))
        router.push(.productList)

        router.pop(count: 10)

        #expect(router.path.isEmpty)
    }

    @Test func replaceAndPopToRootClearNavigationPath() {
        let router = Router()
        router.replace(with: [.detail(id: 1), .productList])

        router.popToRoot()

        #expect(router.path.isEmpty)
    }
}
