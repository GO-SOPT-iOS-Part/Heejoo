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
        
        let liveView = UIImageView().then {
            $0.image = .liveView
        }
        
        let searchView = UIImageView().then {
            $0.image = .searchView
        }
        
        let recordView = UIImageView().then {
            $0.image = .recordView
        }
        
        let firstViewController = UINavigationController(rootViewController: NavigationViewController())
        firstViewController.tabBarItem = UITabBarItem(title: "", image: .home.withRenderingMode(.alwaysOriginal), selectedImage: .homeSelected.withRenderingMode(.alwaysOriginal))
        
        let secondViewController = UIViewController()
        secondViewController.tabBarItem = UITabBarItem(title: "", image: .open.withRenderingMode(.alwaysOriginal), selectedImage: .openSelected.withRenderingMode(.alwaysOriginal))
        secondViewController.view.addSubview(liveView)
        liveView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        let thirdViewController = UIViewController()
        thirdViewController.tabBarItem = UITabBarItem(title: "", image: .search.withRenderingMode(.alwaysOriginal), selectedImage: .searchSelected.withRenderingMode(.alwaysOriginal))
        thirdViewController.view.addSubview(searchView)
        searchView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        let fourthViewController = UIViewController()
        fourthViewController.tabBarItem = UITabBarItem(title: "", image: .record.withRenderingMode(.alwaysOriginal), selectedImage: .recordSelected.withRenderingMode(.alwaysOriginal))
        fourthViewController.view.addSubview(recordView)
        recordView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(40)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
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
