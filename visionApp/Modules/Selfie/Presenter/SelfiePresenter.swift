//
//  SelfiePresenter.swift
//  visionApp
//
//  Created by Kseniya Zharikova on 25/7/22.
//

import Foundation
import UIKit

protocol SelfieViewProtocol: AnyObject {}

protocol SelfiePresenterProtocol: AnyObject {
    init(view:SelfieViewProtocol,detector: Detector, cordinator: CordinatorProtocol)
    func takedPhotoAction(image: UIImage?)
}

final class SelfiePresenter: SelfiePresenterProtocol {
   
    weak var view: SelfieViewProtocol?
    var cordinator: CordinatorProtocol?
    let detector: Detector!
    
    required init(view: SelfieViewProtocol, detector: Detector,cordinator: CordinatorProtocol) {
        self.view = view
        self.cordinator = cordinator
        self.detector = detector
    }
    
    func takedPhotoAction(image: UIImage?) {
        guard let image = image else { return }
        cordinator?.results?.faces = detector.detectFace(image: image)
        cordinator?.openPassportViewController()
    }
}
