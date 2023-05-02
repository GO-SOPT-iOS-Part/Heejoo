//
//  NavigationViewController.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/05/02.
//

import UIKit

import SnapKit
import Then

final class NavigationViewController: BaseViewController {
    
    private let dummy = Navigation.dummy()
    
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: flowLayout)
    private let flowLayout = UICollectionViewFlowLayout()
    
    private let tvingTitle = UIImageView()
    private let wifi = UIImageView()
    private let goToMyPageButton = UIButton()
    
    private lazy var vc1 =  UIViewController().then {
        $0.view.backgroundColor = .systemGray
    }
    private lazy var vc2 =  UIViewController().then {
        $0.view.backgroundColor = .systemPink
    }
    private lazy var vc3 =  UIViewController().then {
        $0.view.backgroundColor = .systemCyan
    }
    private lazy var vc4 =  UIViewController().then {
        $0.view.backgroundColor = .systemBlue
    }
    private lazy var vc5 =  UIViewController().then {
        $0.view.backgroundColor = .systemGreen
    }
    
    private lazy var dataViewControllers: [UIViewController] = {
        return [MainViewController(), vc1, vc2, vc3, vc4, vc5]
    }()
    
    private lazy var pageViewController: UIPageViewController = {
        let vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        return vc
    }()
    
    override func setStyle() {
        wifi.do {
            $0.image = .wifi
        }
        
        tvingTitle.do {
            $0.image = .tvingTitleImage
        }
        
        goToMyPageButton.do {
            $0.setImage(.gotoMyPageButton, for: .normal)
        }
        
        collectionView.do {
            $0.register(NavigationCollectionViewCell.self, forCellWithReuseIdentifier: NavigationCollectionViewCell.className)
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
            $0.isPagingEnabled = true
            $0.backgroundColor = .clear
        }
        
        flowLayout.do {
            $0.itemSize = CGSize(width: 85, height: 27)
            $0.scrollDirection = .horizontal
            $0.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        if let firstVC = dataViewControllers.first {
            pageViewController.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
    }
    
    override func setLayout() {
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        view.addSubviews(tvingTitle,
                         wifi,
                         goToMyPageButton,
                         collectionView)
        
        pageViewController.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        pageViewController.didMove(toParent: self)
        
        tvingTitle.snp.makeConstraints {
            $0.top.equalToSuperview().inset(58)
            $0.leading.equalToSuperview().inset(11)
            $0.width.equalTo(99)
            $0.height.equalTo(25)
        }
        
        wifi.snp.makeConstraints {
            $0.centerY.equalTo(tvingTitle.snp.centerY)
            $0.leading.equalTo(tvingTitle.snp.trailing).offset(195)
        }
        
        goToMyPageButton.snp.makeConstraints {
            $0.centerY.equalTo(tvingTitle.snp.centerY)
            $0.trailing.equalToSuperview().inset(8)
            $0.width.equalTo(33)
            $0.height.equalTo(31)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
        
    }
    
    override func setTarget() {
        goToMyPageButton.addTarget(self, action: #selector(gotoMyPageButtonClicked), for: .touchUpInside)
    }
    
    override func setDelegate() {
        pageViewController.dataSource = self
        pageViewController.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    @objc
    func gotoMyPageButtonClicked() {
        let gotoMyPageViewController = MyPageViewController()
        self.navigationController?.pushViewController(gotoMyPageViewController, animated: true)
    }
    
}

extension NavigationViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = dataViewControllers.firstIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 {
            return nil
        }
        return dataViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = dataViewControllers.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        if nextIndex == dataViewControllers.count {
            return nil
        }
        return dataViewControllers[nextIndex]
    }
}

extension NavigationViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:NavigationCollectionViewCell.className, for: indexPath) as? NavigationCollectionViewCell else { return UICollectionViewCell() }
        cell.configureCell(dummy[indexPath.item])
        return cell
    }
    
}
