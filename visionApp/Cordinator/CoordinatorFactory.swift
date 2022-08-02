//
//  CoordinatorFactory.swift
//  visionApp
//
//  Created by Kseniya Zharikova on 1/8/22.
//

import Foundation
import UIKit

protocol CoordinatorFactory {
    func createCoordinator(navigationController: UINavigationController, builder: Builder, results: ResultsModel) -> Coordinator
}

class VisionCoordinator: CoordinatorFactory {
    func createCoordinator(navigationController: UINavigationController, builder: Builder, results: ResultsModel) -> Coordinator {
        CoordinatorImpl(navigationController: navigationController, builder: builder, results: results)
    }
}
