//
//  PassportViewController.swift
//  visionApp
//
//  Created by Kseniya Zharikova on 27/7/22.
//

import Foundation
import UIKit

final class PassportViewController: UIViewController {
    
    var presenter: PassportPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI() {
        navigationItem.title = "Step 2"
    }
    
    // MARK: - Actions
    
    @IBAction func takePhotoAction(_ sender: Any) {
        openCamera(delegate: self)
    }
}

extension PassportViewController: PickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        presenter.takedPhotoAction(image: info[.originalImage] as? UIImage)
    }
}

extension PassportViewController: PassportViewProtocol {}
