//
//  PassportPresnter.swift
//  visionApp
//
//  Created by Kseniya Zharikova on 27/7/22.
//

import Foundation
import UIKit

protocol PassportViewProtocol: AnyObject {}

protocol PassportPresenterProtocol: AnyObject {
    init(view: PassportViewProtocol,detector: Detector, cordinator: CordinatorProtocol)
    func takedPhotoAction(image: UIImage?)
}

final class PassportPresenter: PassportPresenterProtocol {
   
    weak var view: PassportViewProtocol?
    var cordinator: CordinatorProtocol?
    let detector: Detector!
    
    required init(view: PassportViewProtocol, detector: Detector,cordinator: CordinatorProtocol) {
        self.view = view
        self.cordinator = cordinator
        self.detector = detector
    }
    
    func takedPhotoAction(image: UIImage?) {
        guard let image = image else { return }
        cordinator?.results?.text = detector.detectText(image: image)
        cordinator?.openResultViewController()
    }
}
