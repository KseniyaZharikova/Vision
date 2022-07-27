//
//  Cordinator.swift
//  visionApp
//
//  Created by Kseniya Zharikova on 25/7/22.
//

import Foundation
import UIKit

protocol CordinatorMain {
    var navigationController: UINavigationController? { get set }
    var builder: BuilderProtocol? { get set }
    var results: ResultsModel? { get set }
}

protocol CordinatorProtocol : CordinatorMain {
    func initialViewController()
    func openPassportViewController()
    func openResultViewController()
    func popToRoot()
}

final class Cordinator: CordinatorProtocol {
    
    var navigationController: UINavigationController?
    var builder: BuilderProtocol?
    var results: ResultsModel?
    
    init(navigationController: UINavigationController, builder: BuilderProtocol, results: ResultsModel) {
        self.navigationController = navigationController
        self.builder = builder
        self.results = results
    }
    
    func initialViewController() {
        guard let navigationController = navigationController else { return }
        guard let predictionViewController  = builder?.createSelfieModule(cordinator: self) else { return }
        navigationController.viewControllers = [predictionViewController]
    }
    
    func openPassportViewController() {
        guard let navigationController = navigationController else { return }
        guard let passportViewController = builder?.createPassportModule(cordinator: self) else { return }
        navigationController.pushViewController(passportViewController, animated: true)
    }
    
    func openResultViewController() {
        guard let navigationController = navigationController else { return }
        guard let resultViewController = builder?.createResultModule(cordinator: self) else { return }
        navigationController.pushViewController(resultViewController, animated: true)
    }
    
    func popToRoot() {
        guard let navigationController = navigationController else { return }
        navigationController.popToRootViewController(animated: true)
    }
}
