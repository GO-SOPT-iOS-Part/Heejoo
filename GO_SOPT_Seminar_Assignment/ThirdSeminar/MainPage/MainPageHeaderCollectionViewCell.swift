//
//  MainPageHeaderCollectionViewCell.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/29.
//

import UIKit

import SnapKit
import Then

protocol GoToMyPageButtonAction: AnyObject {
    func gotoMyPageButtonTapped()
}

final class MainPageHeaderCollectionViewCell: UICollectionViewCell {
    
    private let headerImage = UIImageView()
    private let headerBar = UIImageView()
    private let tvingTitle = UIImageView()
    private let goToMyPageButton = UIButton()
    
    weak var cellDelegate: GoToMyPageButtonAction?
    
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
        headerBar.do {
            $0.image = .headerBar
        }
        tvingTitle.do {
            $0.image = .tvingTitleImage
        }
        goToMyPageButton.do {
            $0.setImage(.gotoMyPageButton, for: .normal)
            $0.addTarget(self, action: #selector(gotoMyPageButtonClicked), for: .touchUpInside)
        }
    }
    
    func setLayout() {
        
        contentView.addSubviews(headerImage, headerBar, tvingTitle, goToMyPageButton)
        
        headerImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        headerBar.snp.makeConstraints {
            $0.top.equalToSuperview()
        }
        
        tvingTitle.snp.makeConstraints {
            $0.top.equalToSuperview().inset(58)
            $0.leading.equalToSuperview().inset(11)
            $0.width.equalTo(99)
            $0.height.equalTo(25)
        }
        
        goToMyPageButton.snp.makeConstraints {
            $0.centerY.equalTo(tvingTitle.snp.centerY)
            $0.leading.equalTo(tvingTitle.snp.trailing).offset(240)
            $0.width.equalTo(33)
            $0.height.equalTo(31)
        }
        
    }
    
    func configureCell(_ mainPage: MainPagePhoto) {
        headerImage.image = mainPage.image
    }
    
    @objc
    func gotoMyPageButtonClicked() {
        cellDelegate?.gotoMyPageButtonTapped()
    }
}
