// swift-tools-version:5.10

import PackageDescription

let package = Package(
    name: "Me",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .library(name: "Me", targets: ["Me"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.3.0"),
    ],
    targets: [
        .target(name: "Me")
    ]
)
