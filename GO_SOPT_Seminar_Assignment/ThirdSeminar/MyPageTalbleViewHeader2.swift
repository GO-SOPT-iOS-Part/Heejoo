//
//  MyPageTalbleViewHeader2.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/27.
//

import UIKit

import SnapKit
import Then

final class MyPageTableViewHeader2: UITableViewHeaderFooterView {
    
    private let bar = UIButton()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        bar.do {
            $0.setImage(.sectionBar, for: .normal)
        }
    }
    
    private func setLayout() {
        contentView.addSubview(bar)
        bar.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
    }
    
}
