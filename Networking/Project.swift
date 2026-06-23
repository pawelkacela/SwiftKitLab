import ProjectDescription

let project = Project(
    name: "Networking",
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
