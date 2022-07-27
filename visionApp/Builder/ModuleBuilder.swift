//
//  ModuleBuilder.swift
//  visionApp
//
//  Created by Kseniya Zharikova on 25/7/22.
//

import Foundation
import UIKit

protocol BuilderProtocol {
    func createSelfieModule(cordinator: CordinatorProtocol) -> UIViewController
    func createPassportModule(cordinator: CordinatorProtocol) -> UIViewController
    func createResultModule(cordinator: CordinatorProtocol) -> UIViewController
}

class ModuleBuilder : BuilderProtocol {
    
    func createSelfieModule(cordinator: CordinatorProtocol) -> UIViewController {
        let view = SelfieViewController()
        let detector = Detector()
        let presenter = SelfiePresenter(view: view, detector: detector, cordinator: cordinator)
        view.presenter = presenter
        return view
    }
    
    func createPassportModule(cordinator: CordinatorProtocol) -> UIViewController {
        let view = PassportViewController()
        let detector = Detector()
        let presenter = PassportPresenter(view: view, detector: detector, cordinator: cordinator)
        view.presenter = presenter
        return view
    }
    
    func createResultModule(cordinator: CordinatorProtocol) -> UIViewController {
        let view = ResultViewController()
        let presenter = ResultPresenter(view: view, cordinator: cordinator)
        view.presenter = presenter
        return view
    }
}
