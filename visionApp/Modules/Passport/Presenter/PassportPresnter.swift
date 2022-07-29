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
    init(view: PassportViewProtocol, detector: Detector, coordinator: CoordinatorProtocol)
    func takedPhotoAction(image: UIImage?)
}

final class PassportPresenter: PassportPresenterProtocol {
    weak var view: PassportViewProtocol?
    var coordinator: CoordinatorProtocol?
    let detector: Detector!
    
    required init(view: PassportViewProtocol, detector: Detector, coordinator: CoordinatorProtocol) {
        self.view = view
        self.coordinator = coordinator
        self.detector = detector
    }
    
    func takedPhotoAction(image: UIImage?) {
        guard let image = image else { return }
        
        detector.detectText(image: image, { [weak self] result in
            guard let `self` = self else { return }
            self.coordinator?.results?.textRecognitionResult = result
        })
        
        coordinator?.openResultViewController()
    }
}
