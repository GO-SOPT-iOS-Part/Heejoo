//
//  MyPageTableViewFooter.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/27.
//

import UIKit

import SnapKit
import Then

final class MyPageTableViewFooter: UITableViewHeaderFooterView {

    private let logOutButton = UIButton()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        logOutButton.do {
            $0.setTitle("로그아웃", for: .normal)
            $0.backgroundColor = .black
            $0.setTitleColor(.tvingGray3, for: .normal)
            $0.titleLabel?.font = .tvingSemiBold(ofSize: 14)
            $0.titleLabel?.textAlignment = .center
            $0.makeBorder(width: 1, color: .tvingGray2)
            $0.makeCornerRound(radius: 3)
        }
    }
    
    private func setLayout() {
        contentView.addSubview(logOutButton)
        logOutButton.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.bottom.equalToSuperview().inset(127)
            $0.trailing.leading.equalToSuperview().inset(8)
            $0.height.equalTo(55)
        }
    }
    
}
