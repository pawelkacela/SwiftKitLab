import ProjectDescription

let project = Project(
    name: "AppDomain",
    settings: .settings(
        base: [
            "SWIFT_VERSION": "6",
            "SWIFT_APPROACHABLE_CONCURRENCY": "YES",
            "SWIFT_DEFAULT_ACTOR_ISOLATION": "nonisolated",
        ]
    ),
    targets: [
        .target(
            name: "AppDomain",
            destinations: .macOS,
            product: .framework,
            bundleId: "dev.tuist.AppDomain",
            buildableFolders: [
                "Sources",
            ],
            dependencies: []
        ),
        .target(
            name: "AppDomainTests",
            destinations: .macOS,
            product: .unitTests,
            bundleId: "dev.tuist.AppDomainTests",
            buildableFolders: [
                "Tests",
            ],
            dependencies: [.target(name: "AppDomain")]
        ),
    ]
)
