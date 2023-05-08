//
//  NavigationViewController.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/05/02.
//

import UIKit

import SnapKit
import Then

// MARK: - 여기서 PageViewController와 collectionView 다룸

final class NavigationViewController: BaseViewController {
    
    private let dummy = Navigation.dummy()
    
    // MARK: - currentPage 넘겨주는 함수
    
    private var currentPage: Int = 0 {
        didSet {
            bind(oldValue: oldValue, newValue: currentPage)
        }
    }
    
    // MARK: - 뷰 나타날 때 currentPage 0으로
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        currentPage = 0
    }
    
    // MARK: - collectionView 동작 설정
    
    var isSelected: Int? {
        didSet {
            guard let isSelected else { return }
            collectionView.selectItem(at: IndexPath(item: isSelected, section: 0), animated: true, scrollPosition: .centeredHorizontally)
            
            // MARK: - menuline 동적으로 크기 설정
            
            guard let cell = collectionView.cellForItem(at: IndexPath(item: isSelected, section: 0)) as? NavigationCollectionViewCell else { return }
            
            menuLine.snp.remakeConstraints {
                $0.bottom.equalTo(collectionView.snp.bottom)
                $0.leading.equalTo(cell.snp.leading).offset(-1)
                $0.trailing.equalTo(cell.snp.trailing).offset(1)
                $0.height.equalTo(3)
            }
            
            // MARK: - animate
            
            UIView.animate(withDuration: 0.3) {
                self.menuLine.layoutIfNeeded()
            }
            
        }
    }
    
    // MARK: - collectionView
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: flowLayout)
    private let flowLayout = UICollectionViewFlowLayout()
    
    private let menuLine = UIView().then {
        $0.backgroundColor = .white
    }
    
    // MARK: - collectionView 보다 위에 위치하는 객체들
    
    private let tvingTitle = UIImageView()
    private let wifi = UIImageView()
    private let goToMyPageButton = UIButton()
    
    // MARK: - 뷰컨에 집어넣을 이미지들 (그냥 이쁘게 하려고)
    private let liveImage = UIImageView().then {
        $0.image = .liveImage
    }
    private let tvImage = UIImageView().then {
        $0.image = .tvImage
    }
    private let movieImage = UIImageView().then {
        $0.image = .movieImage
    }
    private let paraImage = UIImageView().then {
        $0.image = .paraImage
    }
    private let kidsImage = UIImageView().then {
        $0.image = .kidsImage
    }
    
    // MARK: - collectionView의 cell을 클릭하면 나오는 각 뷰컨
    
    private lazy var vc1 =  UIViewController().then {
        $0.view.backgroundColor = .black
        $0.view.addSubviews(liveImage)
    }
    private lazy var vc2 =  UIViewController().then {
        $0.view.backgroundColor = .black
        $0.view.addSubviews(tvImage)
    }
    private lazy var vc3 =  UIViewController().then {
        $0.view.backgroundColor = .black
        $0.view.addSubviews(movieImage)
    }
    private lazy var vc4 =  UIViewController().then {
        $0.view.backgroundColor = .black
        $0.view.addSubviews(paraImage)
    }
    private lazy var vc5 =  UIViewController().then {
        $0.view.backgroundColor = .black
        $0.view.addSubviews(kidsImage)
    }
    
    // MARK: - 뷰컨 배열 만들어주기
    
    private lazy var dataViewControllers: [UIViewController] = {
        let mainViewController = MainViewController()
        mainViewController.delegate = self
        return [mainViewController, vc1, vc2, vc3, vc4, vc5]
    }()
    
    // MARK: - pageViewController 선언
    
    private lazy var pageViewController: UIPageViewController = {
        let vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        return vc
    }()
    
    // MARK: - pageViewController의 동작 설정
    
    private func bind(oldValue: Int, newValue: Int) {
        let direction: UIPageViewController.NavigationDirection = oldValue < newValue ? .forward : .reverse
        pageViewController.setViewControllers([dataViewControllers[currentPage]], direction: direction, animated: true, completion: nil)
        self.isSelected = newValue
    }
    
    
    // MARK: - setStyle()
    
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
            $0.backgroundColor = .clear
        }
        
        flowLayout.do {
            $0.scrollDirection = .horizontal
            $0.sectionInset = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
            $0.minimumInteritemSpacing = 30
            $0.minimumLineSpacing = 0
        }
        
        if let firstVC = dataViewControllers.first {
            pageViewController.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
    }
    
    // MARK: - setLayout()
    
    override func setLayout() {
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        view.addSubviews(tvingTitle,
                         wifi,
                         goToMyPageButton,
                         collectionView,
                         menuLine)
        
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
            $0.trailing.equalToSuperview().inset(13)
            $0.width.equalTo(25)
            $0.height.equalTo(25)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(90)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        menuLine.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(-3)
            $0.leading.equalToSuperview().inset(18)
            $0.width.equalTo(15)
            $0.height.equalTo(3)
        }
        
        liveImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(130)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        tvImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(130)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        movieImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(130)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        paraImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(130)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        kidsImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(130)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: - setTarget()
    
    override func setTarget() {
        goToMyPageButton.addTarget(self, action: #selector(gotoMyPageButtonClicked), for: .touchUpInside)
    }
    
    // MARK: - setDelegate()
    
    override func setDelegate() {
        pageViewController.dataSource = self
        pageViewController.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // MARK: - 마이페이지 버튼 클릭했을 때
    
    @objc
    func gotoMyPageButtonClicked() {
        let gotoMyPageViewController = MyPageViewController()
        self.navigationController?.pushViewController(gotoMyPageViewController, animated: true)
    }
    
}

// MARK: - UIPageViewControllerDataSource, UIPageViewControllerDelegate

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
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let currentVC = pageViewController.viewControllers?.first,
              let currentIndex = dataViewControllers.firstIndex(of: currentVC) else { return }
        currentPage = currentIndex
    }
    
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout

extension NavigationViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:NavigationCollectionViewCell.className, for: indexPath) as? NavigationCollectionViewCell else { return UICollectionViewCell() }
        cell.configureCell(dummy[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard collectionView.cellForItem(at: IndexPath(item: isSelected!, section: 0)) is NavigationCollectionViewCell else { return }
        currentPage = indexPath.item
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = NSString(string: dummy[indexPath.row].navigation).boundingRect(
            with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)
            ],
            context: nil)
        
        return CGSize(width: cellSize.width + 5, height: collectionView.frame.height)
    }
}

// MARK: - IsScrolled 프로토콜 상속

extension NavigationViewController: IsScrolled {
    func hide() {
        tvingTitle.isHidden = true
        wifi.isHidden = true
        goToMyPageButton.isHidden = true
        
        collectionView.snp.remakeConstraints {
            $0.top.equalToSuperview().inset(35)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
    }
    
    func notHide() {
        tvingTitle.isHidden = false
        wifi.isHidden = false
        goToMyPageButton.isHidden = false
        
        collectionView.snp.remakeConstraints {
            $0.top.equalToSuperview().inset(90)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
    }
}
