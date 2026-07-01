import ProjectDescription

let project = Project(
    name: "ProductsData",
    settings: .settings(
        base: [
            "SWIFT_VERSION": "6",
            "SWIFT_APPROACHABLE_CONCURRENCY": "YES",
            "SWIFT_DEFAULT_ACTOR_ISOLATION": "nonisolated",
        ]
    ),
    targets: [
        .target(
            name: "ProductsData",
            destinations: .macOS,
            product: .framework,
            bundleId: "dev.tuist.ProductsData",
            buildableFolders: [
                "Sources",
            ],
            dependencies: []
        ),
        .target(
            name: "ProductsDataTests",
            destinations: .macOS,
            product: .unitTests,
            bundleId: "dev.tuist.ProductsDataTests",
            buildableFolders: [
                "Tests",
            ],
            dependencies: [.target(name: "ProductsData")]
        ),
    ]
)
