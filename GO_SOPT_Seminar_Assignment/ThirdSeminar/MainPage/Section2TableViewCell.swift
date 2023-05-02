//
//  Section2TableViewCell.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/30.
//

import UIKit

import SnapKit
import Then

final class Section2TableViewCell: UITableViewCell {

    private let linkButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setStyle() {
        linkButton.do {
            $0.setImage(.linkButton, for: .normal)
        }
        
        separatorInset.left = 0
        selectionStyle = .none
        backgroundColor = .black
    }
    
    private func setLayout() {
        contentView.addSubview(linkButton)
        linkButton.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(58)
        }
    }

}
