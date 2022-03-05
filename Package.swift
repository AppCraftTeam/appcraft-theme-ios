// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ACTheme",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(
            name: "ACTheme",
            targets: ["ACTheme"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ACTheme",
            dependencies: [],
            path: "Sources/ACTheme"
        )
    ]
)
