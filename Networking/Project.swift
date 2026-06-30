import ProjectDescription

let project = Project(
    name: "Networking",
    settings: .settings(
        base: [
            "SWIFT_VERSION": "6",
            "SWIFT_APPROACHABLE_CONCURRENCY": "YES",
            "SWIFT_DEFAULT_ACTOR_ISOLATION": "nonisolated",
        ]
    ),
    targets: [
        .target(
            name: "Networking",
            destinations: .macOS,
            product: .framework,
            bundleId: "dev.tuist.Networking",
            buildableFolders: [
                "Sources",
            ],
            dependencies: []
        ),
        .target(
            name: "NetworkingTests",
            destinations: .macOS,
            product: .unitTests,
            bundleId: "dev.tuist.NetworkingTests",
            buildableFolders: [
                "Tests",
            ],
            dependencies: [.target(name: "Networking")]
        ),
    ]
)
