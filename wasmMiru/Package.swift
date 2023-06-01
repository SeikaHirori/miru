// swift-tools-version:5.6
import PackageDescription
let package = Package(
    name: "wasmMiru",
    platforms: [.macOS(.v11), .iOS(.v13)],
    products: [
        .executable(name: "wasmMiru", targets: ["wasmMiru"])
    ],
    dependencies: [
        .package(url: "https://github.com/TokamakUI/Tokamak", from: "0.11.0")
    ],
    targets: [
        .executableTarget(
            name: "wasmMiru",
            dependencies: [
                .product(name: "TokamakShim", package: "Tokamak")
            ]),
        .testTarget(
            name: "wasmMiruTests",
            dependencies: ["wasmMiru"]),
    ]
)