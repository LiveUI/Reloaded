// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "Reloaded",
    platforms: [
       .macOS(.v10_12),
       .iOS(.v10),
       .watchOS(.v2)
    ],
    products: [
        .library(name: "Reloaded", targets: ["Reloaded"])
    ],
    dependencies: [],
    targets: [
        .target(name: "Reloaded", dependencies: []),
        .testTarget(
            name: "ReloadedTests",
            dependencies: [
                "Reloaded"
            ]
        ),
    ]
)
