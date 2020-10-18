// swift-tools-version:5.0
//===----------------------------------------------------------------------===//
//
// This source file is part of the AsyncHTTPClient open source project
//
// Copyright (c) 2018-2019 Apple Inc. and the AsyncHTTPClient project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of AsyncHTTPClient project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

import PackageDescription

let package = Package(
    name: "async-http-client",
    products: [
        .library(name: "AsyncHTTPClient", targets: ["AsyncHTTPClient"]),
    ],
    dependencies: [
        .package(url: "https://github.com/val-verde/swift-nio.git", .branch("val-verde-mainline")),
        .package(url: "https://github.com/val-verde/swift-nio-ssl.git", .branch("val-verde-mainline")),
        .package(url: "https://github.com/val-verde/swift-nio-extras.git", .branch("val-verde-mainline")),
        .package(url: "https://github.com/apple/swift-nio-transport-services.git", from: "1.5.1"),
        .package(url: "https://github.com/val-verde/swift-log.git", .branch("val-verde-mainline")),
    ],
    targets: [
        .target(
            name: "AsyncHTTPClient",
            dependencies: ["NIO", "NIOHTTP1", "NIOSSL", "NIOConcurrencyHelpers", "NIOHTTPCompression",
                           "NIOFoundationCompat", "NIOTransportServices", "Logging"]
        ),
        .testTarget(
            name: "AsyncHTTPClientTests",
            dependencies: ["NIO", "NIOConcurrencyHelpers", "NIOSSL", "AsyncHTTPClient", "NIOFoundationCompat",
                           "NIOTestUtils", "Logging"]
        ),
    ]
)
