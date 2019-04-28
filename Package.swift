// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ConsoleGithub",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "ConsoleGithub",
            targets: ["ConsoleGithub"]),
    ],
    dependencies: [
        // подключаем зависимость-пакет Alamofire, указываем ссылку на GitHub
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "4.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "ConsoleGithub",
    dependencies: ["Alamofire"]),
        .testTarget(
            name: "ConsoleGithubTests",
            dependencies: ["ConsoleGithub"]),
    ]
)
