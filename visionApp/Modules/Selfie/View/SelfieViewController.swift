//
//  SelfieViewController.swift
//  visionApp
//
//  Created by Kseniya Zharikova on 25/7/22.
//

import UIKit

final class SelfieViewController: UIViewController {
    
    var presenter: SelfiePresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI() {
        navigationItem.title = "Step 1"
    }
    
    
    // MARK: - Actions
    
    @IBAction func takePhotoAction(_ sender: Any) {
        openCamera(delegate: self)
    }
}

extension SelfieViewController: PickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        presenter.takedPhotoAction(image: info[.originalImage] as? UIImage)
    }
}

extension SelfieViewController: SelfieViewProtocol {}
