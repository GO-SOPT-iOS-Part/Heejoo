//
//  SceneDelegate.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/07.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let navigationController = UINavigationController(rootViewController: NavigationViewController())
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
    
}




