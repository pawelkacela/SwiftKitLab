import ProjectDescription

  let project = Project(
      name: "AuthAPI",
      settings: .settings(
          base: [
              "SWIFT_VERSION": "6",
              "SWIFT_APPROACHABLE_CONCURRENCY": "YES",
              "SWIFT_DEFAULT_ACTOR_ISOLATION": "nonisolated",
          ]
      ),
      targets: [
          .target(
              name: "AuthAPI",
              destinations: .macOS,
              product: .framework,
              bundleId: "dev.tuist.AuthAPI",
              buildableFolders: [
                  "Sources",
              ],
              dependencies: [
                  .project(
                      target: "Networking",
                      path: "../Networking"
                  )
              ]
          ),
          .target(
              name: "AuthAPITests",
              destinations: .macOS,
              product: .unitTests,
              bundleId: "dev.tuist.AuthAPITests",
              buildableFolders: [
                  "Tests",
              ],
              dependencies: [
                  .target(name: "AuthAPI"),
                  .project(
                      target: "Networking",
                      path: "../Networking"
                  ),
              ]
          ),
      ]
  )
