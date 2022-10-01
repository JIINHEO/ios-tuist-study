//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by jiinheo on 2022/09/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

private let projectName = "DesignKit"

let project = Project.makeModule(
    name: projectName,
    product: .staticFramework,
    dependencies: [],
    resources: ["Resources/**"]
)
