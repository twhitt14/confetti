// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "L360Confetti",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "L360Confetti",
            type: .static,
            targets: ["L360Confetti"]),
    ],
    targets: [
//        .target(
//            name: "L360Confetti",
//            dependencies: [],
//            path: "./L360Confetti",
//            sources: ["Sources"]
//        ),
    ]
)
