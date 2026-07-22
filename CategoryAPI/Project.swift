import ProjectDescription

let project = Project(
    name: "CategoryAPI",
    settings: .settings(
        base: [
            "SWIFT_VERSION": "6",
            "SWIFT_APPROACHABLE_CONCURRENCY": "YES",
            "SWIFT_DEFAULT_ACTOR_ISOLATION": "nonisolated",
        ]
    ),
    targets: [
        .target(
            name: "CategoryAPI",
            destinations: .macOS,
            product: .framework,
            bundleId: "dev.tuist.CategoryAPI",
            buildableFolders: [
                "Sources",
            ],
            dependencies: [
                .project(target: "Networking", path: "../Networking")
            ]
        ),
        .target(
            name: "CategoryAPITests",
            destinations: .macOS,
            product: .unitTests,
            bundleId: "dev.tuist.CategoryAPITests",
            buildableFolders: [
                "Tests",
            ],
            dependencies: [
                .target(name: "CategoryAPI"),
                .project(target: "Networking", path: "../Networking"),
            ]
        ),
    ]
)
