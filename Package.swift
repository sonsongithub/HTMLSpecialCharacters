// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "HTMLSpecialCharacters",
    targets: [
        .target(name: "HTMLSpecialCharacters", path: "Sources"),
        .testTarget(name: "HTMLSpecialCharactersTest", dependencies: ["HTMLSpecialCharacters"], path: "Tests"),
    ]
)
