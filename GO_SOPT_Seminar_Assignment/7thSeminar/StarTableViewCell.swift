//
//  StarTableViewCell.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/05/29.
//

import UIKit

import SnapKit
import Then

final class StarTableViewCell: UITableViewCell {
    
    var isTapped: Bool = false {
        didSet {
            tapped()
        }
    }
    
    var handler: (() -> (Void))?
    
    private lazy var carrotImage = UIImageView()
    private let productLabel = UILabel()
    private let placeLabel = UILabel()
    private let timeLabel = UILabel()
    private let reservationLabel = UILabel()
    private let priceLabel = UILabel()
    private let horizontalStackView = UIStackView()
    let likeButton = UIButton()

    
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
        
        separatorInset.left = 0
        
        selectionStyle = .none
        
        carrotImage.do {
            $0.makeCornerRound(radius: 5)
        }
        
        productLabel.do {
            $0.font = UIFont.systemFont(ofSize: 12)
        }
        
        placeLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 11)
        }
        
        timeLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 11)
        }
        
        reservationLabel.do {
            $0.textAlignment = .center
            $0.textColor = .white
            $0.font = UIFont.boldSystemFont(ofSize: 11)
            $0.makeCornerRound(radius: 3)
        }
        
        priceLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 13)
        }
        
        horizontalStackView.do {
            $0.axis = .horizontal
            $0.distribution = .fill
            $0.alignment = .center
            $0.spacing = 5
        }
        
        likeButton.do {
            $0.tintColor = .blue
            $0.addTarget(self,
                         action: #selector(likeButtonTapped),
                         for: .touchUpInside)
        }
    }
    
    func setLayout() {
        
        [carrotImage, productLabel, placeLabel,
         timeLabel, horizontalStackView, likeButton]
            .forEach { contentView.addSubview($0) }
        
        [reservationLabel, priceLabel]
            .forEach { horizontalStackView.addArrangedSubview($0) }
        
        carrotImage.snp.makeConstraints {
            $0.size.equalTo(100)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
        }
        
        productLabel.snp.makeConstraints {
            $0.leading.equalTo(carrotImage.snp.trailing).offset(14)
            $0.top.equalToSuperview().inset(10)
        }
        
        placeLabel.snp.makeConstraints {
            $0.leading.equalTo(productLabel.self)
            $0.top.equalTo(productLabel.snp.bottom).offset(6)
        }
        
        timeLabel.snp.makeConstraints {
            $0.leading.equalTo(placeLabel.snp.trailing).offset(3)
            $0.top.equalTo(placeLabel.self)
        }
        
        reservationLabel.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.width.equalTo(50)
        }
        
        horizontalStackView.snp.makeConstraints {
            $0.leading.equalTo(placeLabel.self)
            $0.top.equalTo(timeLabel.snp.bottom).offset(6)
            $0.height.equalTo(30)
        }
        
        likeButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(35)
        }
    }
    
    func tapped() {
        let image = isTapped ? "star.fill" : "star"
        likeButton.setImage(UIImage(systemName: image), for: .normal)
    }
    
    @objc
    func likeButtonTapped() {
        handler?()
    }
    
    func configureCell(_ carrot: RealmModel) {
        
        carrotImage.image = UIImage(named: carrot.imageName)
        productLabel.text = carrot.title
        placeLabel.text = carrot.place
        timeLabel.text = carrot.time
        isTapped = carrot.liked
        
        reservationLabel.text = carrot.tradeStatus
        switch carrot.tradeStatus {
        case "거래완료" :
            reservationLabel.backgroundColor = .black
        case "예약중" :
            reservationLabel.backgroundColor = .systemGreen
        case "나눔완료" :
            reservationLabel.backgroundColor = .gray
        default :
            reservationLabel.backgroundColor = .white
            reservationLabel.isHidden = true
        }
                
        var price = String(carrot.price)
        
        price.insert(",", at: price.index(price.endIndex, offsetBy: -3))
        priceLabel.text = price + "원"
    }
}

