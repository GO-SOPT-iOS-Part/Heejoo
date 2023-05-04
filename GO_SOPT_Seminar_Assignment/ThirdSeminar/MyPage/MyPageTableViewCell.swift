//
//  MyPageTableViewCell.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/26.
//

import UIKit

import SnapKit
import Then

// MARK: - TableView의 cell 설정
final class MyPageTableViewCell: UITableViewCell {
    
    private let infoLabel = UILabel()
    private let arrowImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setStyle() {
        infoLabel.do {
            $0.textColor = .tvingGray3
            $0.font = .tvingMedium(ofSize: 15)
        }
        
        separatorInset.left = 0
        selectionStyle = .none
        backgroundColor = .black
    }
    
    func setLayout() {
        contentView.addSubviews(infoLabel, arrowImage)
        
        infoLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(18)
        }
        
        arrowImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
        }
    }
    
    func configureCell(_ myPage: MyPage) {
        infoLabel.text = myPage.information
        arrowImage.image = myPage.image
    }
}
