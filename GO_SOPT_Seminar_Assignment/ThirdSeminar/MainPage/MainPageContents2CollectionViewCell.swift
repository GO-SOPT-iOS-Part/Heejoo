//
//  MainPageContents2CollectionViewCell.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/30.
//

import UIKit

import SnapKit
import Then

final class MainPageContents2CollectionViewCell: UICollectionViewCell {
        
    private let collectionViewImage = UIImageView()
    private let collectionViewNumber = UILabel()
    private let collectionViewBroadcaster = UILabel()
    private let collectionViewProgram = UILabel()
    private let collectionViewRate = UILabel()
    private let horizontalStackView = UIStackView()
    
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
        collectionViewNumber.do {
            $0.textColor = .white
            $0.font = .tvingBold(ofSize: 19)
        }
        collectionViewBroadcaster.do {
            $0.textColor = .white
            $0.font = .tvingRegular(ofSize: 10)
        }
        collectionViewProgram.do {
            $0.textColor = .tvingGray3
            $0.font = .tvingRegular(ofSize: 10)
        }
        collectionViewRate.do {
            $0.textColor = .tvingGray3
            $0.font = .tvingRegular(ofSize: 10)
        }
        horizontalStackView.do {
            $0.axis = .vertical
            $0.distribution = .equalSpacing
            $0.alignment = .leading
        }
    }
    
    func setLayout() {
        contentView.addSubviews(collectionViewImage,collectionViewNumber,horizontalStackView)
        [collectionViewBroadcaster, collectionViewProgram, collectionViewRate]
            .forEach { horizontalStackView.addArrangedSubview($0) }
        
        collectionViewImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.width.equalTo(160)
            $0.height.equalTo(80)
        }
        
        collectionViewNumber.snp.makeConstraints {
            $0.top.equalToSuperview().inset(105)
            $0.leading.equalToSuperview().inset(10)
            $0.width.equalTo(12)
            $0.height.equalTo(30)
        }
        
        horizontalStackView.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.top.equalToSuperview().inset(107)
            $0.leading.equalToSuperview().inset(27)
        }
    }

    
    func configureCell(_ mainPage: MainPage2) {
        collectionViewImage.image = mainPage.image
        collectionViewNumber.text = mainPage.number
        collectionViewBroadcaster.text = mainPage.broadcaster
        collectionViewProgram.text = mainPage.program
        collectionViewRate.text = mainPage.rating
    }
}
