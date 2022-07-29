//
//  SceneDelegate.swift
//  visionApp
//
//  Created by Kseniya Zharikova on 25/7/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let bulder = ModuleBuilder()
        let results = ResultsModel()
        let navigationViewController = UINavigationController()
        window?.rootViewController = navigationViewController
        let coordinator = Coordinator(navigationController: navigationViewController, builder: bulder, results: results)
        coordinator.initialViewController()
        window?.makeKeyAndVisible()
    }
}

