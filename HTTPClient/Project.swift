import ProjectDescription

let project = Project(
    name: "HTTPClient",
    targets: [
        .target(
            name: "HTTPClient",
            destinations: .macOS,
            product: .framework,
            bundleId: "dev.tuist.HTTPClient",
            buildableFolders: [
                "Sources",
            ],
            dependencies: []
        ),
        .target(
            name: "HTTPClientTests",
            destinations: .macOS,
            product: .unitTests,
            bundleId: "dev.tuist.HTTPClientTests",
            buildableFolders: [
                "Tests",
            ],
            dependencies: [.target(name: "HTTPClient")]
        ),
    ]
)
