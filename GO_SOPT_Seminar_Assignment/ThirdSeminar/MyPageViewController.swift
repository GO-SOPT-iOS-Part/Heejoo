//
//  MyPageViewController.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/26.
//

import UIKit

import SnapKit
import Then


final class MyPageViewController: BaseViewController {
    
    private let myPageAllView = UITableView(frame: .zero, style: .grouped)
    
    private let dummy1 = MyPage.dummy1()
    private let dummy2 = MyPage.dummy2()
    
    override func setStyle() {
                
        myPageAllView.do {
            $0.rowHeight = 54
            $0.delegate = self
            $0.dataSource = self
            $0.backgroundColor = .black
            setRegister()
        }
    }
    
    override func setLayout() {
        
        view.addSubview(myPageAllView)
        myPageAllView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets)
            $0.bottom.equalTo(view.safeAreaInsets)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func setRegister() {
        myPageAllView.register(MyPageTableViewCell.self, forCellReuseIdentifier: MyPageTableViewCell.className)
        myPageAllView.register(MyPageTableViewHeader.self, forHeaderFooterViewReuseIdentifier: MyPageTableViewHeader.className)
        myPageAllView.register(MyPageTableViewHeader2.self, forHeaderFooterViewReuseIdentifier: MyPageTableViewHeader2.className)
        myPageAllView.register(MyPageTableViewFooter.self, forHeaderFooterViewReuseIdentifier: MyPageTableViewFooter.className)
    }
}

extension MyPageViewController: UITableViewDelegate {}

extension MyPageViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyPageTableViewHeader") as! MyPageTableViewHeader
        cell.cellDelegate = self
        if section == 0 {
            return cell
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 370 : 32
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return section == 1 ? tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyPageTableViewFooter") : nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 1 ? 205 : 0
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? dummy1.count : dummy2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPageTableViewCell.className, for: indexPath) as? MyPageTableViewCell else { return UITableViewCell() }
        
        if indexPath.section == 0 {
            cell.configureCell(dummy1[indexPath.row])
        } else {
            cell.configureCell(dummy2[indexPath.row])
        }
        
        return cell
        
    }
    
}

extension MyPageViewController: GoToMain {
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
