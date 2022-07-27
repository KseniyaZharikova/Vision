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
    
    var presenter: ResultPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpResult()
    }
    
    func setUpUI() {
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    func setUpResult() {
        faceStatusTitle.text = presenter.model?.faceStatus.title
        faceStatusTitle.textColor = presenter.model?.faceStatus.color
        faceErrorTitle.text = presenter.model?.faceStatus.error
        
        documentStatusTitle.text = presenter.model?.textStatus.title
        documentStatusTitle.textColor = presenter.model?.textStatus.color
        documentErrorTitle.text = presenter.model?.textStatus.error
    }
    
    @IBAction func tryAgainAction(_ sender: Any) {
        presenter.tryAgain()
    }
}

extension ResultViewController: ResultViewProtocol {}
