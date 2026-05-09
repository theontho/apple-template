// swift-tools-version: 6.1

import PackageDescription

let package = Package(
  name: "apple-template",
  platforms: [
    .iOS(.v17),
    .macOS(.v14),
  ],
  products: [
    .library(name: "AppleTemplateCore", targets: ["AppleTemplateCore"]),
    .executable(name: "apple-template", targets: ["AppleTemplateCLI"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.6.0")
  ],
  targets: [
    .target(name: "AppleTemplateCore"),
    .executableTarget(
      name: "AppleTemplateCLI",
      dependencies: [
        "AppleTemplateCore",
        .product(name: "ArgumentParser", package: "swift-argument-parser"),
      ]
    ),
    .testTarget(name: "AppleTemplateCoreTests", dependencies: ["AppleTemplateCore"]),
    .testTarget(name: "AppleTemplateCLITests", dependencies: ["AppleTemplateCLI"]),
  ]
)
