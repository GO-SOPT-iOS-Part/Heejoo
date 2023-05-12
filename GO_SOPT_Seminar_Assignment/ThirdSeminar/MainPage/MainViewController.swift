//
//  MainViewController.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/24.
//

import UIKit

import SnapKit
import Then

// MARK: - 프로토콜 선언

protocol IsScrolled: AnyObject {
    func hide()
    func notHide()
}

final class MainViewController: BaseViewController {
    
    //MARK: - 구조체에 data 담아주기
    
    private var networkResult: [Movie] = [] {
        didSet {
            self.mainPageAllView.reloadData()
        }
    }
    
    //    private let dummy = MainPage.dummy()
    
    override func viewDidLoad() {
        setStyle()
        setLayout()
        getMovie()
    }
    
    weak var delegate: IsScrolled?
    var isScrolled = false
    
    // MARK: - mainPageView를 UITableView()로
    
    private let mainPageAllView = UITableView()
    
    // MARK: - 스크롤 되면 NavigationViewController의 collectionView 배경을 설정
    
    private let backGroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 0.118, green: 0.118, blue: 0.118, alpha: 0.8)
        $0.isHidden = true
    }
    
    // MARK: - setStyle()
    
    override func setStyle() {
        
        mainPageAllView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.backgroundColor = .black
            $0.contentInsetAdjustmentBehavior = .never
            setRegister()
        }
    }
    
    // MARK: - setLayout()
    
    override func setLayout() {
        
        view.addSubviews(mainPageAllView, backGroundView)
        
        mainPageAllView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        backGroundView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(75)
        }
    }
    
    // MARK: - setRegister()
    
    func setRegister() {
        mainPageAllView.register(CollectionTableViewCell.self, forCellReuseIdentifier:  CollectionTableViewCell.className)
        mainPageAllView.register(Collection2TableViewCell.self, forCellReuseIdentifier:  Collection2TableViewCell.className)
        mainPageAllView.register(Collection3TableViewCell.self, forCellReuseIdentifier:  Collection3TableViewCell.className)
        mainPageAllView.register(Collection4TableViewCell.self, forCellReuseIdentifier:  Collection4TableViewCell.className)
        mainPageAllView.register(Section2TableViewCell.self, forCellReuseIdentifier:  Section2TableViewCell.className)
        mainPageAllView.register(Collection5TableViewCell.self, forCellReuseIdentifier:  Collection5TableViewCell.className)
        
    }
}

// MARK: - 스크롤 인식 시

extension MainViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 100 {
            if isScrolled == false {
                isScrolled = true
                delegate?.hide()
                backGroundView.isHidden = false
            }
        } else if scrollView.contentOffset.y < 0 {
            isScrolled = false
            delegate?.notHide()
            backGroundView.isHidden = true
        }
    }
}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 550
        } else if indexPath.section == 1 {
            if indexPath.row == 1 {
                return 180
            } else {
                return 230
            }
        } else if indexPath.section == 2{
            return 150
        } else {
            return 230
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.className, for: indexPath) as? CollectionTableViewCell else { return UITableViewCell() }
            return cell
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: Collection2TableViewCell.className, for: indexPath) as? Collection2TableViewCell else { return UITableViewCell() }
                cell.networkResult = networkResult // TableViewCell의 data == ViewControllerdml data
                return cell
            } else if indexPath.row == 1 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: Collection3TableViewCell.className, for: indexPath) as? Collection3TableViewCell else { return UITableViewCell() }
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: Collection4TableViewCell.className, for: indexPath) as? Collection4TableViewCell else { return UITableViewCell() }
                cell.networkResult = networkResult
                return cell
            }
        } else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Section2TableViewCell.className, for: indexPath) as? Section2TableViewCell else { return UITableViewCell() }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Collection5TableViewCell.className, for: indexPath) as? Collection5TableViewCell else { return UITableViewCell() }
            cell.networkResult = networkResult
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        case 2:
            return 1
        case 3:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 3 {
            return 103
        } else {
            return 0
        }
    }
    
}

// MARK: - API CALL

extension MainViewController {
    func getMovie() {
        MovieRequest.shared.getMovie() { response in
            switch response {
            case .success(let data):
                guard let data = data as? MovieResponse else { return }
                
                for i in 0...(data.results.count - 1) {
                    let appendData = Movie(url: data.results[i].posterPath, title: data.results[i].title)
                    self.networkResult.append(appendData)
                } // results의 개수만큼 반복하면서 data를 append 해줌
                
                dump(data)
                
            default:
                print("failed")
                return
            }
        }
    }
}

