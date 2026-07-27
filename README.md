# SwiftKitLab

> A modular SwiftUI playground for exploring architecture, navigation, networking, dependency injection, and testing in modern Swift.

SwiftKitLab is a small macOS sample application built for learning and experimentation. It is not intended to be a production-ready product; instead, it provides a focused place to try architectural ideas and Swift APIs without the complexity of a full application.

The current example fetches paginated product data from the [DummyJSON](https://dummyjson.com) API and displays it in a SwiftUI interface.

## What this project explores

- SwiftUI with the Observation framework (`@Observable`)
- Swift concurrency with `async`/`await`
- Modular project generation with Tuist
- Layered architecture and separation of concerns
- MVVM for presentation logic
- Protocol-oriented dependency inversion
- Constructor-based dependency injection
- Type-safe navigation with `NavigationStack`
- DTO-to-domain model mapping
- Pagination, loading, and error states
- Unit testing with Swift Testing
- Test doubles and preview-specific mock services

## Architecture

The project uses a pragmatic layered architecture split across independent modules:

```text
SwiftKitLab (App)
    │
    ├── AppDomain
    │     Domain models and service contracts
    │
    └── ProductsData
          Service implementations and model mapping
              │
              ├── ProductsAPI
              │     API models and endpoint definitions
              │
              └── Networking
                    Request building, URLSession, decoding, and errors
```

Dependencies point toward the domain layer. `AppDomain` has no knowledge of networking or concrete data providers, while `ProductsData` implements its service protocols using `ProductsAPI` and `Networking`. This keeps business-facing models and contracts independent from transport details.

### Module responsibilities

| Module | Responsibility |
| --- | --- |
| `App` | SwiftUI views, view models, navigation, and dependency composition |
| `AppDomain` | Domain models and service protocols used by the app |
| `ProductsData` | Concrete service implementations and API-to-domain mapping |
| `ProductsAPI` | Product DTOs and endpoint definitions |
| `Networking` | Generic request construction, URLSession execution, decoding, and API errors |

## Pattern choices

### MVVM

SwiftUI views focus on rendering state and forwarding user actions. `@Observable` view models own presentation state, coordinate asynchronous work, and communicate through domain service protocols. This makes view behavior easier to test without performing real network requests.

### Dependency inversion and injection

The app depends on abstractions such as `ProductService`, not directly on concrete networking implementations. `AppDependencies` acts as the composition root and creates the live dependency graph. Dependencies are passed through initializers, which also makes it straightforward to provide stubs in tests and mocks in previews.

### Repository-style service boundary

Domain service protocols form a boundary between presentation and data access. Concrete services in `ProductsData` build requests through `ProductsAPI`, use the shared networking client, and map transport models into domain models before returning them to the app.

### Coordinator-style routing

Navigation state is centralized in an observable `Router`. A type-safe `Route` enum describes destinations, while `RootView` maps those routes to SwiftUI screens. This keeps navigation decisions explicit and makes stack operations independently testable.

### Model mapping

API response models remain separate from domain models. Explicit mapping prevents backend-specific response shapes from leaking into the presentation and domain layers.

## Testing

The test suite uses the Swift Testing framework and currently covers:

- View-model loading, pagination, and failure behavior
- Router stack operations
- Endpoint path, method, and query construction
- API-to-domain model mapping

Protocol-based services allow tests to use lightweight stubs rather than live network calls.

## Getting started

### Requirements

- macOS
- Xcode with Swift 6 support
- [Tuist](https://tuist.dev)

### Generate and run

```bash
git clone git@github.com:pawelkacela/SwiftKitLab.git
cd SwiftKitLab
tuist generate
open SwiftKitLab.xcworkspace
```

Select the `SwiftKitLab` scheme in Xcode and run the app.

### Run tests

Run the test suite from Xcode or from the command line:

```bash
tuist test
```

## Project status

SwiftKitLab is an evolving sandbox. Some screens and examples may be intentionally simple or incomplete while a specific concept is being explored. The architecture may also change as new approaches are tested and compared.
