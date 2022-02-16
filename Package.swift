// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PwgenSwift",
    products: [
        .library(
            name: "Cpwgen",
            targets: ["Cpwgen"]
        ),
        .library(
            name: "PwgenSwift",
            targets: ["PwgenSwift"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Cpwgen",
            dependencies: [],
            exclude: [
                "lib/debian",
                "lib/configure.ac",
                "lib/depfix.sed",
                "lib/install-sh",
                "lib/Makefile.in",
                "lib/pwgen.1",
                "lib/wordwrap.pl"
            ]
        ),
        .target(
            name: "PwgenSwift",
            dependencies: ["Cpwgen"]
        ),
        .testTarget(
            name: "PwgenSwiftTests",
            dependencies: ["PwgenSwift"]
        ),
    ]
)
