//
//  SceneDelegate.swift
//  Cella
//
//  Created by Jamaldin on 10/10/22.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        if Auth.auth().currentUser != nil {
            window?.rootViewController = MainViewController()
        } else {
            window?.rootViewController = RegisterViewController()
        }
        window?.makeKeyAndVisible()
        guard let _ = (scene as? UIWindowScene) else { return }
    }


}

