//
//  NavigationCollectionViewCell.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/05/02.
//

import UIKit

import SnapKit
import Then

// MARK: - collectionViewCell 설정

final class NavigationCollectionViewCell: UICollectionViewCell {
        
    private let navigationLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        navigationLabel.do {
            $0.font = .tvingRegular(ofSize: 17)
            $0.textAlignment = .center
            $0.textColor = .white
        }
    }
    
    func setLayout() {
        contentView.addSubview(navigationLabel)
        
        navigationLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    func configureCell(_ navigation: Navigation) {
        navigationLabel.text = navigation.navigation
    }
    
}
