//
//  MainViewController.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/24.
//

import UIKit

import SnapKit
import Then

class MainViewController: BaseViewController {
    
    private let mainPageAllView = UITableView()
    private let headerBar = UIImageView()
    private let tvingTitle = UIImageView()
    private let wifi = UIImageView()
    private let goToMyPageButton = UIButton()
    
    private let dummy = MainPage.dummy()
    
    override func setStyle() {
        
        mainPageAllView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.backgroundColor = .black
            setRegister()
        }
        
        headerBar.do {
            $0.image = .headerBar
        }
        
        wifi.do {
            $0.image = .wifi
        }
        
        tvingTitle.do {
            $0.image = .tvingTitleImage
        }
        
        goToMyPageButton.do {
            $0.setImage(.gotoMyPageButton, for: .normal)
            $0.addTarget(self, action: #selector(gotoMyPageButtonClicked), for: .touchUpInside)
        }
    }
    
    override func setLayout() {
        
        view.addSubviews(mainPageAllView,
                         headerBar,
                         tvingTitle,
                         wifi,
                         goToMyPageButton)
        
        mainPageAllView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets)
            $0.bottom.equalTo(view.safeAreaInsets)
            $0.leading.trailing.equalToSuperview()
        }
        
        headerBar.snp.makeConstraints {
            $0.top.equalToSuperview().inset(55)
            $0.leading.trailing.equalToSuperview()
        }
        
        tvingTitle.snp.makeConstraints {
            $0.top.equalToSuperview().inset(115)
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
            $0.leading.equalTo(tvingTitle.snp.trailing).offset(240)
            $0.width.equalTo(33)
            $0.height.equalTo(31)
        }
        
    }
    
    func setRegister() {
        mainPageAllView.register(CollectionTableViewCell.self, forCellReuseIdentifier:  CollectionTableViewCell.className)
        mainPageAllView.register(Collection2TableViewCell.self, forCellReuseIdentifier:  Collection2TableViewCell.className)
        mainPageAllView.register(Collection3TableViewCell.self, forCellReuseIdentifier:  Collection3TableViewCell.className)
        mainPageAllView.register(Collection4TableViewCell.self, forCellReuseIdentifier:  Collection4TableViewCell.className)
        mainPageAllView.register(Section2TableViewCell.self, forCellReuseIdentifier:  Section2TableViewCell.className)
        mainPageAllView.register(Collection5TableViewCell.self, forCellReuseIdentifier:  Collection5TableViewCell.className)
        
    }
    
    @objc
    func gotoMyPageButtonClicked() {
        let gotoMyPageViewController = MyPageViewController()
        self.navigationController?.pushViewController(gotoMyPageViewController, animated: true)
    }
}

extension MainViewController: UITableViewDelegate {}
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
            cell.configureCell()
            return cell
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: Collection2TableViewCell.className, for: indexPath) as? Collection2TableViewCell else { return UITableViewCell() }
                cell.configureCell()
                return cell
            } else if indexPath.row == 1 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: Collection3TableViewCell.className, for: indexPath) as? Collection3TableViewCell else { return UITableViewCell() }
                cell.configureCell()
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: Collection4TableViewCell.className, for: indexPath) as? Collection4TableViewCell else { return UITableViewCell() }
                cell.configureCell()
                return cell
            }
        } else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Section2TableViewCell.className, for: indexPath) as? Section2TableViewCell else { return UITableViewCell() }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Collection5TableViewCell.className, for: indexPath) as? Collection5TableViewCell else { return UITableViewCell() }
            cell.configureCell()
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

