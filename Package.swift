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
            url: "https://github.com/jeremyabannister/ExpressionErgonomics",
            from: "0.1.5"
        ),
        .package(
            url: "https://github.com/jeremyabannister/ErrorMessage",
            from: "0.1.0"
        ),
        .package(
            url: "https://github.com/jeremyabannister/FoundationTestToolkit",
            from: "0.1.0"
        ),
        .package(
            url: "https://github.com/jeremyabannister/XCTestTestToolkit",
            from: "0.1.0"
        ),
    ],
    targets: [
        .target(
            name: "Testable",
            dependencies: ["ErrorMessage", "ExpressionErgonomics", "FoundationTestToolkit", "XCTestTestToolkit"]
        ),
        .target(
            name: "TestableTestToolkit",
            dependencies: ["Testable", "XCTestTestToolkit"]
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
