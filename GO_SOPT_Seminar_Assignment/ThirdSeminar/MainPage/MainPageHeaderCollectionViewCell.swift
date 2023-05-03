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
        
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout() {
        
        contentView.addSubviews(headerImage)
        
        headerImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    func configureCell(_ mainPage: MainPagePhoto) {
        headerImage.image = mainPage.image
    }

}
