// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "DigitekaSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "DigitekaSDK",
            targets: ["DigitekaXCFramework"]),
    ],
    dependencies: [
    ],
    targets: [
        .binaryTarget(
            name: "DigitekaXCFramework",
            path: "DigitekaSDK.xcframework"
        )
    ]
)
