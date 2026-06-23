import ProjectDescription

let project = Project(
    name: "SwiftKitLab",
    settings: .settings(
        base: [
            "SWIFT_VERSION": "6",
            "SWIFT_APPROACHABLE_CONCURRENCY": "YES",
            "SWIFT_DEFAULT_ACTOR_ISOLATION": "nonisolated",
        ]
    ),
    targets: [
        .target(
            name: "SwiftKitLab",
            destinations: .macOS,
            product: .app,
            bundleId: "dev.tuist.SwiftKitLab",
            infoPlist: .default,
            buildableFolders: [
                "Sources",
                "Resources",
            ],
            dependencies: [
                .project(target: "HTTPClient", path: "../HTTPClient"),
                .project(target: "Networking", path: "../Networking")
            ]
        ),
        .target(
            name: "SwiftKitLabTests",
            destinations: .macOS,
            product: .unitTests,
            bundleId: "dev.tuist.SwiftKitLabTests",
            infoPlist: .default,
            buildableFolders: [
                "Tests"
            ],
            dependencies: [.target(name: "SwiftKitLab")]
        ),
    ]
)
