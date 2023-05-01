//
//  PageViewController.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/05/02.
//

import UIKit

import SnapKit
import Then

final class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    private var pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    private lazy var PageViewControllerList = [MainViewController()]
            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPageViewController()
        setupPageViewController()
    }
    
    
    // MARK: Pageview를 구성할 ViewController 생성
    func createPageViewController()
    {
        let vc1 = MainViewController()
        vc1.view.backgroundColor = UIColor.systemBlue
        
        let vc2 = MainViewController()
        vc2.view.backgroundColor = UIColor.systemIndigo
        
        let vc3 = MainViewController()
        vc3.view.backgroundColor = UIColor.systemCyan
        
        let vc4 = MainViewController()
        vc4.view.backgroundColor = UIColor.systemPink
        
        let vc5 = MainViewController()
        vc4.view.backgroundColor = UIColor.systemGray
        
        PageViewControllerList.append(vc1)
        PageViewControllerList.append(vc2)
        PageViewControllerList.append(vc3)
        PageViewControllerList.append(vc4)
        PageViewControllerList.append(vc5)
    }
    
    
    // MARK: PageViewController 설정
    func setupPageViewController()
    {
        // MARK: PageViewController DataSource 연결
        self.dataSource = self
        
        //첫번째로 위치할 ViewController 배치
        if let firstviewController = PageViewControllerList.first
        {
            setViewControllers([firstviewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }
    
    
    // MARK: - 😀 Place for UIPageViewControllerDataSource
    // MARK: 이전페이지에 위치할 ViewController return
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = PageViewControllerList.firstIndex(of: viewController as! MainViewController) else{ return nil }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else
        {
            return PageViewControllerList.last
        }
        
        guard PageViewControllerList.count > previousIndex else
        {
            return nil
        }
        return PageViewControllerList[previousIndex]
    }
    
    // MARK: 다음페이지에 위치할 ViewController return
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = PageViewControllerList.firstIndex(of: viewController as! MainViewController) else
        {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard PageViewControllerList.count != nextIndex else
        {
            return PageViewControllerList.first
        }
        
        guard PageViewControllerList.count > nextIndex else
        {
            return nil
        }
        
        return PageViewControllerList[nextIndex]
    }
}
