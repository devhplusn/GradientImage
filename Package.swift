// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GradientImage",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "GradientImage",
            targets: ["GradientImage"]),
    ],
    targets: [
        .target(
            name: "GradientImage",
            dependencies: []),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
