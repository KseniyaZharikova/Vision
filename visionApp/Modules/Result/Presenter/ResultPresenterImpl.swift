//
//  ResultPresenterImpl.swift
//  visionApp
//
//  Created by Kseniya Zharikova on 27/7/22.
//

import Foundation
import UIKit

protocol ResultView: AnyObject {}

protocol ResultPresenter: AnyObject {
    init(view: ResultView, coordinator: Coordinator)
    var model: ResultsModel? {get set}
    func tryAgain()
}

final class ResultPresenterImpl: ResultPresenter {
    let view: ResultView
    var coordinator: Coordinator?
    var model: ResultsModel?
    
    required init(view: ResultView, coordinator: Coordinator) {
        self.view = view
        self.coordinator = coordinator
        self.model = coordinator.results
    }
    
    func tryAgain() {
        coordinator?.popToRoot()
    }
}
