//
//  ResultPresenter.swift
//  visionApp
//
//  Created by Kseniya Zharikova on 27/7/22.
//

import Foundation
import UIKit

protocol ResultViewProtocol: AnyObject {}

protocol ResultPresenterProtocol: AnyObject {
    init(view:  ResultViewProtocol, coordinator: CoordinatorProtocol)
    var model: ResultsModel? {get set}
    func tryAgain()
}

final class ResultPresenter: ResultPresenterProtocol {
  
    weak var view:  ResultViewProtocol?
    var coordinator: CoordinatorProtocol?
    var model: ResultsModel?
    
    required init(view: ResultViewProtocol,coordinator: CoordinatorProtocol) {
        self.view = view
        self.coordinator = coordinator
        self.model = coordinator.results
    }
    
    func tryAgain() {
        coordinator?.popToRoot()
    }
}
