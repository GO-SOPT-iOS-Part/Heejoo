//
//  MyPageCollection2ViewCell.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/29.
//

import UIKit

final class MainPageContentsCollectionViewCell: UICollectionViewCell {
        
    private let collectionViewItem = UIImageView()
    private let collectionViewItemName = UILabel()
    
    
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
        collectionViewItemName.do {
            $0.font = .tvingMedium(ofSize: 10)
            $0.textColor = .tvingGray3
        }
    }
    
    func setLayout() {
        contentView.addSubviews(collectionViewItem, collectionViewItemName)
        
        collectionViewItem.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(98)
            $0.height.equalTo(146)
        }
        collectionViewItemName.snp.makeConstraints {
            $0.top.equalTo(collectionViewItem.snp.bottom).offset(3)
        }
        
        
    }

    func configureCell(_ mainPage: MainPage) {
        collectionViewItem.image = mainPage.image
        collectionViewItemName.text = mainPage.program
    }
}
