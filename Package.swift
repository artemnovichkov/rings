// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Rings",
    platforms: [
        .macOS(.v14),
    ],
    products: [
        .library(name: "Rings", targets: ["Rings"]),
        .executable(name: "RingsCLI", targets: ["RingsCLI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.0"),
    ],
    targets: [
        .target(name: "Rings", resources: [.process("Resources")]),
        .executableTarget(name: "RingsCLI", dependencies: [
            .byName(name: "Rings"),
            .product(name: "ArgumentParser", package: "swift-argument-parser")
        ]),
    ]
)
