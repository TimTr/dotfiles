// swift-tools-version: 6.0
import PackageDescription

// Docs for the Package.swift file:
// https://docs.swift.org/package-manager/PackageDescription/PackageDescription.html


let package = Package(
    name: "DotRunner",
    targets: [
        .executableTarget(
            name: "dotrunner",
            path: "DotRunner",
            sources: ["main.swift"])
    ] // close the targets list
)





/**
 .executableTarget(
     name: "fizzbuzz-c",
     path: "second-target")
*/

    
/***
    defaultLocalization: [LanguageTag]? = nil,
    platforms: [SupportedPlatform]? = nil,
    products: [Product] = [],
    dependencies: [Package.Dependency] = [],
    targets: [Target] = [],
    swiftLanguageVersions: [SwiftVersion]? = nil,
    cLanguageStandard: CLanguageStandard? = nil,
    cxxLanguageStandard: CXXLanguageStandard? = nil
*/

