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
    init(view:  ResultViewProtocol, cordinator: CordinatorProtocol)
    var model: ResultsModel? {get set}
    func tryAgain()
}

final class ResultPresenter: ResultPresenterProtocol {
  
    weak var view:  ResultViewProtocol?
    var cordinator: CordinatorProtocol?
    var model: ResultsModel?
    
    required init(view: ResultViewProtocol,cordinator: CordinatorProtocol) {
        self.view = view
        self.cordinator = cordinator
        self.model = cordinator.results
    }
    
    func tryAgain() {
        cordinator?.popToRoot()
    }
  
}
