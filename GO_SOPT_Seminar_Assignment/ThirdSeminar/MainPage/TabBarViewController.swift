//
//  ViewController.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/05/03.
//

import UIKit

import SnapKit
import Then

final class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = UIColor.black // TabBar 의 배경 색
        tabBar.isTranslucent = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let firstViewController = UINavigationController(rootViewController: NavigationViewController())
        firstViewController.tabBarItem = UITabBarItem(title: "", image: .home.withRenderingMode(.alwaysOriginal), selectedImage: .homeSelected.withRenderingMode(.alwaysOriginal))
        
        let secondViewController = UIViewController()
        secondViewController.tabBarItem = UITabBarItem(title: "", image: .open.withRenderingMode(.alwaysOriginal), selectedImage: .openSelected.withRenderingMode(.alwaysOriginal))
        
        let thirdViewController = UIViewController()
        thirdViewController.tabBarItem = UITabBarItem(title: "", image: .search.withRenderingMode(.alwaysOriginal), selectedImage: .searchSelected.withRenderingMode(.alwaysOriginal))
        
        
        let fourthViewController = UIViewController()
        fourthViewController.tabBarItem = UITabBarItem(title: "", image: .record.withRenderingMode(.alwaysOriginal), selectedImage: .recordSelected.withRenderingMode(.alwaysOriginal))
        
        self.viewControllers = [firstViewController,
                                secondViewController,
                                thirdViewController,
                                fourthViewController]
    }
    
    override func viewDidLayoutSubviews() {
                super.viewDidLayoutSubviews()
                var tabFrame = self.tabBar.frame
                tabFrame.size.height = 75
                tabFrame.origin.y = self.view.frame.size.height - 60
                self.tabBar.frame = tabFrame
    }

}
