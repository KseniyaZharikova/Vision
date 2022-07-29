//
//  ResultsModel.swift
//  visionApp
//
//  Created by Kseniya Zharikova on 27/7/22.
//

import Foundation
import UIKit

struct ResultsModel {
    var faceRecognitionResult: Result<UIImage,ErrorReason>?
    var textRecognitionResult: Result<[String],ErrorReason>?
    
    init(_ faceRecognitionResult: Result<UIImage,ErrorReason>? = nil, _ textRecognitionResult: Result<[String],ErrorReason>? = nil) {
        self.faceRecognitionResult = faceRecognitionResult
        self.textRecognitionResult = textRecognitionResult
    }
}
