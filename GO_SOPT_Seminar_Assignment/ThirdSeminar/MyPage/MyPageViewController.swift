//
//  MyPageViewController.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/26.
//

import UIKit

import SnapKit
import Then

// MARK: - 마이페이지 뷰컨

final class MyPageViewController: BaseViewController {
    
    // MARK: - 마이페이지 안에 UITableView를 넣어 전체가 스크롤 되게 함
    
    private let myPageAllView = UITableView(frame: .zero, style: .grouped)
    
    private let dummy1 = MyPage.dummy1()
    private let dummy2 = MyPage.dummy2()
    
    // MARK: - navigationBar에 넣을 아이템들
    private let backButton = UIButton()
    private let alarmButton = UIButton()
    private let settingButton = UIButton()
    
    // MARK: - view가 나타날 때 navigationBar 설정
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        setNavigationBar()
    }
    
    // MARK: - setStyle()
    
    override func setStyle() {
        
        myPageAllView.do {
            $0.rowHeight = 54
            $0.delegate = self
            $0.dataSource = self
            $0.backgroundColor = .black
            setRegister()
        }
    }
    
    // MARK: - setLayout()
    
    override func setLayout() {
        
        view.addSubview(myPageAllView)
        myPageAllView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets)
            $0.bottom.equalTo(view.safeAreaInsets)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func setNavigationBar() {
        
        self.navigationController?.isNavigationBarHidden = false
        
        backButton.setImage(.backButton, for: .normal)
        backButton.snp.makeConstraints {
            $0.width.equalTo(8)
            $0.height.equalTo(15)
        }
        backButton.addTarget(self,
                      action: #selector(backButtonTaped),
                      for: .touchUpInside)
        let back = UIBarButtonItem(customView: backButton)
        
        alarmButton.setImage(.alarm, for: .normal)
        alarmButton.snp.makeConstraints {
            $0.width.equalTo(30)
            $0.height.equalTo(42)
        }
        
        settingButton.setImage(.setting, for: .normal)
        settingButton.snp.makeConstraints {
            $0.width.equalTo(33)
            $0.height.equalTo(31)
        }
        
        let righthStackview = UIStackView.init(arrangedSubviews: [alarmButton, settingButton])
        righthStackview.distribution = .equalSpacing
        righthStackview.axis = .horizontal
        righthStackview.alignment = .center
        righthStackview.spacing = 17
        let rightStackBarButtonItem = UIBarButtonItem(customView: righthStackview)
        
        navigationItem.leftBarButtonItem = back
        navigationItem.rightBarButtonItem = rightStackBarButtonItem
    }
    
    // MARK: - setRegister()
    
    func setRegister() {
        myPageAllView.register(MyPageTableViewCell.self, forCellReuseIdentifier: MyPageTableViewCell.className)
        myPageAllView.register(MyPageTableViewHeader.self, forHeaderFooterViewReuseIdentifier: MyPageTableViewHeader.className)
        myPageAllView.register(MyPageTableViewHeader2.self, forHeaderFooterViewReuseIdentifier: MyPageTableViewHeader2.className)
        myPageAllView.register(MyPageTableViewFooter.self, forHeaderFooterViewReuseIdentifier: MyPageTableViewFooter.className)
    }
    
    @objc
    func backButtonTaped() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - TableView 설정

extension MyPageViewController: UITableViewDelegate {}

extension MyPageViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return section == 0 ? tableView.dequeueReusableHeaderFooterView(withIdentifier: MyPageTableViewHeader.className) as! MyPageTableViewHeader :
        tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyPageTableViewHeader2") as! MyPageTableViewHeader2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 326 : 32
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return section == 1 ? tableView.dequeueReusableHeaderFooterView(withIdentifier: MyPageTableViewFooter.className) : nil
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

