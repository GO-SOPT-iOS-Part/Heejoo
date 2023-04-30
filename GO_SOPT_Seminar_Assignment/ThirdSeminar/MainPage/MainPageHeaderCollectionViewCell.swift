//
//  MainPageHeaderCollectionViewCell.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/29.
//

import UIKit

import SnapKit
import Then

final class MainPageHeaderCollectionViewCell: UICollectionViewCell {
    
    private let headerImage = UIImageView()
    
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
        headerImage.do {
            $0.image = .headerImage
        }
    }
    
    func setLayout() {
        
        contentView.addSubview(headerImage)
        
        headerImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.edges.equalToSuperview()
            $0.height.equalTo(498)
        }
    }

    func configureCell() {
    }
}
