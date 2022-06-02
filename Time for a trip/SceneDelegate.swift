//
//  SceneDelegate.swift
//  Time for a trip
//
//  Created by Dmitrii Lobanov on 31.05.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let flightsListingVC = FlightsListingVC()
        let navigationVC = UINavigationController(rootViewController: flightsListingVC)
        
        window.rootViewController = navigationVC
        
        window.makeKeyAndVisible()
        
        self.window = window
    }
}
