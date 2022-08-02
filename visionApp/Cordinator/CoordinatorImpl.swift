//
//  CoordinatorImpl.swift
//  visionApp
//
//  Created by Kseniya Zharikova on 25/7/22.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController? { get }
    var builder: Builder? { get set }
    var results: ResultsModel? { get set }
    
    func initialViewController()
    func openPassportViewController()
    func openResultViewController()
    func popToRoot()
}

final class CoordinatorImpl: Coordinator {
    
    var navigationController: UINavigationController?
    var builder: Builder?
    var results: ResultsModel?
    
    init(navigationController: UINavigationController, builder: Builder, results: ResultsModel) {
        self.navigationController = navigationController
        self.builder = builder
        self.results = results
    }
    
    func initialViewController() {
        guard let navigationController = navigationController else { return }
        guard let predictionViewController  = builder?.createSelfieModule(coordinator: self) else { return }
        navigationController.viewControllers = [predictionViewController]
    }
    
    func openPassportViewController() {
        guard let navigationController = navigationController else { return }
        guard let passportViewController = builder?.createPassportModule(coordinator: self) else { return }
        navigationController.pushViewController(passportViewController, animated: true)
    }
    
    func openResultViewController() {
        guard let navigationController = navigationController else { return }
        guard let resultViewController = builder?.createResultModule(coordinator: self) else { return }
        navigationController.pushViewController(resultViewController, animated: true)
    }
    
    func popToRoot() {
        guard let navigationController = navigationController else { return }
        navigationController.popToRootViewController(animated: true)
    }
}
