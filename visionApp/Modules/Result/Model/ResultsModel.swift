//
//  ResultsModel.swift
//  visionApp
//
//  Created by Kseniya Zharikova on 27/7/22.
//

import Foundation
import UIKit

struct ResultsModel {
    var faces: Int
    var text: Int
    
    init(_ faces: Int = .zero ,_ text: Int = .zero) {
        self.faces = faces
        self.text = text
    }
    
    var faceStatus: FaceStatus {
        switch faces {
        case 0:
            return .noFace
        case 1:
            return .success
        default:
            return .moreThanOneFace
        }
    }
    
    var textStatus: TextStatus {
        switch text {
        case 0:
            return .noText
        default:
            return .success
        }
    }
    
}

enum FaceStatus {
    case noFace, moreThanOneFace, success
    
    var title: String {
        switch self {
        case .moreThanOneFace,.noFace:
            return "Failure"
        case.success:
            return "Success"
        }
    }
    
    var error: String {
        switch self {
        case .moreThanOneFace:
            return "More than one face. Please make sure there is only one face in the photo."
        case .noFace:
            return "No faces found in the photo. Please make sure that your face is clearly visible."
        default:
            return ""
            
        }
    }
    
    var color: UIColor {
        switch self {
        case .moreThanOneFace,.noFace:
            return .red
        case.success:
            return .green
        }
    }
}

enum TextStatus {
    case noText, success
    
    var title: String {
        switch self {
        case .noText:
            return "Failure"
        case.success:
            return "Success"
        }
    }
    
    var error: String {
        switch self {
        case .noText:
            return "No documents found in the photo. Please make sure that your ID card is clearly visible."
        default:
            return ""
        }
    }
    
    var color: UIColor {
        switch self {
        case .noText:
            return .red
        case.success:
            return .green
        }
    }
}
