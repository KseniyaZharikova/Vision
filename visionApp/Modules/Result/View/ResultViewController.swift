//
//  ResultViewController.swift
//  visionApp
//
//  Created by Kseniya Zharikova on 27/7/22.
//

import Foundation
import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet weak var faceStatusTitle: UILabel!
    @IBOutlet weak var faceErrorTitle: UILabel!
    
    @IBOutlet weak var documentStatusTitle: UILabel!
    @IBOutlet weak var documentErrorTitle: UILabel!
    
    var presenter: ResultPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpResult()
    }
    
    func setUpUI() {
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    func setUpResult() {
        guard let model = presenter.model else { return }
        
        switch model.faceRecognitionResult {
        case .success:
            faceStatusTitle.text = "Success"
            faceStatusTitle.textColor = .green
            faceErrorTitle.isHidden = true
        case .failure(let error):
            faceStatusTitle.text = "Failure"
            faceStatusTitle.textColor = .red
            faceErrorTitle.text = error.message
            faceErrorTitle.isHidden = false
        case .none:
            return
        }
        
        switch model.textRecognitionResult {
        case .success:
            documentStatusTitle.text = "Success"
            documentStatusTitle.textColor = .green
            documentErrorTitle.isHidden = true
        case .failure(let error):
            documentStatusTitle.text = "Failure"
            documentStatusTitle.textColor = .red
            documentErrorTitle.text = error.message
            documentErrorTitle.isHidden = false
        case .none:
            return
        }
        
    }
    
    // MARK: - Actions
    
    @IBAction func tryAgainAction(_ sender: Any) {
        presenter.tryAgain()
    }
}

extension ResultViewController: ResultView {}
