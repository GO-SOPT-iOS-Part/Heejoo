//
//  MainViewController.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/24.
//

import UIKit

final class MainViewController: BaseViewController {
    
    private let originView = MainView()
    
    override func loadView() {
        self.view = originView
    }
    
    override func setTarget() {
        originView.myPageButton.addTarget(self,
                                          action: #selector(myPageButtonTapped),
                                          for: .touchUpInside)
    }
    
    
    @objc
    func myPageButtonTapped() {
        let gotoMyPageViewController = MyPageViewController()
        self.navigationController?.pushViewController(gotoMyPageViewController, animated: true)
    }
}
