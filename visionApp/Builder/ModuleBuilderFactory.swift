//
//  ModuleBuilderFactory.swift
//  visionApp
//
//  Created by Kseniya Zharikova on 1/8/22.
//

import Foundation
import Foundation
import UIKit

protocol ModuleBuilderFactory {
    func createModuleBuilder() -> Builder
}

class VisionModuleBuilder: ModuleBuilderFactory {
    func createModuleBuilder() -> Builder {
        BuilderImpl()
    }
}
