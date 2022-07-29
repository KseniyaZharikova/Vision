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
    init(view:SelfieViewProtocol, detector: Detector, coordinator: CoordinatorProtocol)
    func takedPhotoAction(image: UIImage?)
}

final class SelfiePresenter: SelfiePresenterProtocol {
   
    weak var view: SelfieViewProtocol?
    var coordinator: CoordinatorProtocol?
    let detector: Detector!
    
    required init(view: SelfieViewProtocol, detector: Detector, coordinator: CoordinatorProtocol) {
        self.view = view
        self.coordinator = coordinator
        self.detector = detector
    }
    
    func takedPhotoAction(image: UIImage?) {
        guard let image = image else { return }
        
        detector.detectFace(image: image, { [weak self] result in
            guard let `self` = self else { return }
            self.coordinator?.results?.faceRecognitionResult = result
        })
        
        coordinator?.openPassportViewController()
    }
}
