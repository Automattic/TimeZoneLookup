// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftTimeZoneLookup",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SwiftTimeZoneLookup",
            targets: ["SwiftTimeZoneLookup"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "CZoneDetect"),
        .target(
            name: "SwiftTimeZoneLookup",
            dependencies: ["CZoneDetect"],
            // Excluding Resources since it's not correctly being picked up, and gets copied once per target
            // resources: [.process("Resources")]),
            resources: []),
        .testTarget(
            name: "SwiftTimeZoneLookupTests",
            dependencies: ["SwiftTimeZoneLookup"],
            resources: [.copy("Maps/timezone16.bin"), .copy("Maps/timezone21.bin")]),
    ]
)
