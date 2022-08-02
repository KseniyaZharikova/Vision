//
//  Detector.swift
//  visionApp
//
//  Created by Kseniya Zharikova on 27/7/22.
//

import Vision
import UIKit

enum ErrorReason: Error {
    case noFace
    case moreThanOneFace
    case noText
    case unowned
    
    var message: String {
        switch self {
        case .moreThanOneFace:
            return "More than one face. Please make sure there is only one face in the photo."
        case .noFace:
            return "No faces found in the photo. Please make sure that your face is clearly visible."
        case .noText:
            return "No documents found in the photo. Please make sure that your ID card is clearly visible."
        case .unowned:
            return "Unknown error"
        }
    }
}

final class Detector {
    
    func detectFace(image: UIImage, _ completion: @escaping (Result<UIImage, ErrorReason>) -> Void) {
        let request = VNDetectFaceRectanglesRequest { (request, error) in
            if let _ = error {
                completion(.failure(.unowned))
            }
            
            guard let results = request.results else {
                completion(.failure(.unowned))
                return
            }
            
            if results.count == .zero {
                completion(.failure(.noFace))
            } else if results.count > 1 {
                completion(.failure(.moreThanOneFace))
            } else {
                completion(.success(image))
            }
        }
        
        detect(image: image, reguest: request)
    }
    
    func detectText(image: UIImage, _ completion: @escaping (Result<[String], ErrorReason>) -> Void) {
        let request = VNRecognizeTextRequest { (request, error) in
            if let _ = error {
                completion(.failure(.unowned))
            }
            
            guard let observations = request.results as? [VNRecognizedTextObservation] else {
                completion(.failure(.unowned))
                return
            }
            
            let recognizedStrings = observations.compactMap { observation in
                return observation.topCandidates(1).first?.string
            }
            
            recognizedStrings.count == .zero ? completion(.failure(.noText)) : completion(.success(recognizedStrings))
        }
        
        detect(image: image, reguest: request)
    }
    
    private  func detect(image: UIImage, reguest: VNImageBasedRequest) {
        guard let cgImage = image.cgImage else { return }
        
        let handler = VNImageRequestHandler(cgImage: cgImage,options: [:])
        do {
            try handler.perform([reguest])
        } catch {
            print("Unable to perform the requests: \(error).")
        }
    }
}
