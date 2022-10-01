//import ProjectDescription
//
//extension Project {
//    public static func app(
//        name: String,
//        product: Product,
//        platform: Platform,
//        dependencies: [TargetDependency] = []
//    ) -> Project {
//        return self.project(
//            name: name,
//            product: product,
//            platform: platform,
//            dependencies: dependencies,
//            infoPlist: [
//                "CFBundleShortVersionString": "1.0",
//                "CFBundleVersion": "1",
//                "UIMainStoryboardFile": "",
//                "UILaunchStoryboardName": "LaunchScreen"
//            ]
//        )
//    }
//
//    public static func framework(
//        name: String,
//        platform: Platform,
//        dependencies: [TargetDependency] = []
//    ) -> Project {
//        return self.project(
//            name: name,
//            product: .framework,
//            platform: platform,
//            dependencies: dependencies
//        )
//    }
//
//    public static func project(
//        name: String,
//        product: Product,
//        platform: Platform,
//        dependencies: [TargetDependency] = [],
//        infoPlist: [String: InfoPlist.Value] = [:]
//    ) -> Project {
//        return Project(
//            name: name,
//            targets: [
//                Target(
//                    name: name,
//                    platform: platform,
//                    product: product,
//                    bundleId: "com.jiin.\(name)",
//                    infoPlist: .extendingDefault(with: infoPlist),
//                    sources: ["Sources/**/"],
//                    resources: ["Resources/**"],
//                    dependencies: dependencies
//                ),
//                Target(
//                    name: "\(name)Tests",
//                    platform: platform,
//                    product: .unitTests,
//                    bundleId: "com.jiin.\(name)Tests",
//                    infoPlist: .default,
//                    sources: "Tests/**",
//                    dependencies: [
//                        .target(name: "\(name)")
//                    ]
//                )
//            ]
//        )
//    }
//}

import ProjectDescription

public extension Project {
    static func makeModule(
        name: String,
        platform: Platform = .iOS,
        product: Product,
        organizationName: String = "jiinheo",
        packages: [Package] = [],
        deploymentTarget: DeploymentTarget? = .iOS(targetVersion: "15.0", devices: [.iphone ]),
        dependencies: [TargetDependency] = [],
        sources: SourceFilesList = ["Sources/**"],
        resources: ResourceFileElements? = nil,
        infoPlist: InfoPlist = .default
    ) -> Project {
        let settings: Settings = .settings(
            base: [:],
            configurations: [
                .debug(name: .debug),
                .release(name: .release)
            ], defaultSettings: .recommended)

        let appTarget = Target(
            name: name,
            platform: platform,
            product: product,
            bundleId: "\(organizationName).\(name)",
            deploymentTarget: deploymentTarget,
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            dependencies: dependencies
        )

        let testTarget = Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: "\(organizationName).\(name)Tests",
            deploymentTarget: deploymentTarget,
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [.target(name: name)]
        )

        let schemes: [Scheme] = [.makeScheme(target: .debug, name: name)]

        let targets: [Target] = [appTarget, testTarget]

        return Project(
            name: name,
            organizationName: organizationName,
            packages: packages,
            settings: settings,
            targets: targets,
            schemes: schemes
        )
    }
}

extension Scheme {
    static func makeScheme(target: ConfigurationName, name: String) -> Scheme {
        return Scheme(
            name: name,
            shared: true,
            buildAction: .buildAction(targets: ["\(name)"]),
            testAction: .targets(
                ["\(name)Tests"],
                configuration: target,
                options: .options(coverage: true, codeCoverageTargets: ["\(name)"])
            ),
            runAction: .runAction(configuration: target),
            archiveAction: .archiveAction(configuration: target),
            profileAction: .profileAction(configuration: target),
            analyzeAction: .analyzeAction(configuration: target)
        )
    }
}

