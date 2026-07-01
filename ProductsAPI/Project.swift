import ProjectDescription

let project = Project(
    name: "ProductsAPI",
    settings: .settings(
        base: [
            "SWIFT_VERSION": "6",
            "SWIFT_APPROACHABLE_CONCURRENCY": "YES",
            "SWIFT_DEFAULT_ACTOR_ISOLATION": "nonisolated",
        ]
    ),
    targets: [
        .target(
            name: "ProductsAPI",
            destinations: .macOS,
            product: .framework,
            bundleId: "dev.tuist.ProductsAPI",
            buildableFolders: [
                "Sources",
            ],
            dependencies: []
        ),
        .target(
            name: "ProductsAPITests",
            destinations: .macOS,
            product: .unitTests,
            bundleId: "dev.tuist.ProductsAPITests",
            buildableFolders: [
                "Tests",
            ],
            dependencies: [.target(name: "ProductsAPI")]
        ),
    ]
)
