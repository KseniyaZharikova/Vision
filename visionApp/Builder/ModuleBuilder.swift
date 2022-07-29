//
//  ModuleBuilder.swift
//  visionApp
//
//  Created by Kseniya Zharikova on 25/7/22.
//

import Foundation
import UIKit

protocol BuilderProtocol {
    func createSelfieModule(coordinator: CoordinatorProtocol) -> UIViewController
    func createPassportModule(coordinator: CoordinatorProtocol) -> UIViewController
    func createResultModule(coordinator: CoordinatorProtocol) -> UIViewController
}

class ModuleBuilder : BuilderProtocol {
    
    func createSelfieModule(coordinator: CoordinatorProtocol) -> UIViewController {
        let view = SelfieViewController()
        let detector = Detector()
        let presenter = SelfiePresenter(view: view, detector: detector, coordinator: coordinator)
        view.presenter = presenter
        return view
    }
    
    func createPassportModule(coordinator: CoordinatorProtocol) -> UIViewController {
        let view = PassportViewController()
        let detector = Detector()
        let presenter = PassportPresenter(view: view, detector: detector, coordinator: coordinator)
        view.presenter = presenter
        return view
    }
    
    func createResultModule(coordinator: CoordinatorProtocol) -> UIViewController {
        let view = ResultViewController()
        let presenter = ResultPresenter(view: view, coordinator: coordinator)
        view.presenter = presenter
        return view
    }
}
