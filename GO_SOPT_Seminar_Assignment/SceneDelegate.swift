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
        self.window = UIWindow(windowScene: windowScene)
        
//        let tabBarVC = UITabBarController()
//
//        let vc1 = UINavigationController(rootViewController: CarrotViewController())
//        let vc2 = StarViewController()
//
//        tabBarVC.setViewControllers([vc1, vc2], animated: false)
//        tabBarVC.modalPresentationStyle = .fullScreen
//        tabBarVC.tabBar.backgroundColor = .white
//
//        guard let items = tabBarVC.tabBar.items else {return}
//        items[0].image = UIImage(systemName: "house")
//        items[1].image = UIImage(systemName: "star")
    
        
        self.window?.rootViewController = TabBarViewController()
        self.window?.makeKeyAndVisible()
    }
}










