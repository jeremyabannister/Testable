// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "Testable",
    products: [
        .library(
            name: "Testable",
            targets: ["Testable"]
        ),
        .library(
            name: "TestableTestToolkit",
            targets: ["TestableTestToolkit"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/jeremyabannister/ErrorMessage",
            from: "0.1.1"
        ),
        .package(
            url: "https://github.com/jeremyabannister/XCTestToolkit",
            from: "0.1.2"
        ),
    ],
    targets: [
        .target(
            name: "Testable",
            dependencies: ["ErrorMessage", "XCTestToolkit"]
        ),
        .target(
            name: "TestableTestToolkit",
            dependencies: ["Testable"]
        ),
        .testTarget(
            name: "Testable-tests",
            dependencies: ["TestableTestToolkit"]
        ),
        .testTarget(
            name: "TestableTestToolkit-tests",
            dependencies: ["TestableTestToolkit"]
        ),
    ]
)
