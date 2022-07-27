//
//  Detector.swift
//  visionApp
//
//  Created by Kseniya Zharikova on 27/7/22.
//

import Foundation
import Vision
import UIKit

final class Detector {

    var results: [VNObservation]?
    
    func detectFace(image: UIImage) -> Int {
        let request = VNDetectFaceRectanglesRequest(completionHandler: self.recognizeFaceHandler)
        detect(image: image, reguest: request)
        return results?.count ?? .zero
    }
    
    func detectText(image: UIImage) -> Int {
        let request = VNRecognizeTextRequest(completionHandler: self.recognizeTextHandler)
        detect(image: image, reguest: request)
        return results?.count ?? .zero
    }
    
    func detect(image: UIImage, reguest: VNImageBasedRequest) {
        guard let cgImage = image.cgImage else { return }
        
        let handler = VNImageRequestHandler(cgImage: cgImage,options: [:])
        do {
            try handler.perform([reguest])
        } catch {
            print("Unable to perform the requests: \(error).")
        }
    }
    
    func recognizeTextHandler(request: VNRequest, error: Error?) {
        guard let results = request.results as? [VNRecognizedTextObservation] else { return }
        self.results = results
    }
    
    func recognizeFaceHandler(request: VNRequest, error: Error?) {
        guard let results = request.results as? [VNFaceObservation] else { return }
        self.results = results
    }
}
