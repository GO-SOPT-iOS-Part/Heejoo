//
//  MyPageTableViewHeader.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/27.
//

import UIKit

import SnapKit
import Then

final class MyPageTableViewHeader: UITableViewHeaderFooterView {
        
    let myUser:String = UserDefaults.standard.string(forKey: "userID")!

    private let profileImage = UIButton()
    private let myName = UILabel()
    private let changeProfile = UIButton()
    
    private let myInfo = UILabel()
    private let myInfoUseImage = UIButton()
    private let myInfoUseLabel = UILabel()
    private let myInfoUseText  = UILabel()
    private let myInfoCashImage = UIButton()
    private let myInfoCashLabel = UILabel()
    private let myInfoCashText = UILabel()
    
    private let someContents = UILabel()
    private let someContentsText1 : UILabel = {
        let label = UILabel()
        let leadingImage = NSTextAttachment(image: .tvnjtbc)
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(string: "이용권을 구매하고 "))
        attributedString.append(NSAttributedString(attachment: leadingImage))
        attributedString.append(NSAttributedString(string: " 등 인기 TV프로그램과"))
        label.attributedText = attributedString
        label.textColor = .tvingGray3
        label.font = .tvingSemiBold(ofSize: 12)
        return label
    }()
    private let someContentsText2 = UILabel()
    private let arrowButton = UIButton()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        profileImage.do {
            $0.setImage(.tvingProfile, for: .normal)
            $0.makeCornerRound(radius: 15)
        }
        myName.do {
            $0.text = myUser
            $0.textColor = .white
            $0.font = .tvingMedium(ofSize: 17)
        }
        changeProfile.do {
            $0.setTitle("프로필 전환", for: .normal)
            $0.backgroundColor = .black
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .tvingSemiBold(ofSize: 10)
            $0.titleLabel?.textAlignment = .center
            $0.makeBorder(width: 1, color: .tvingGray2)
            $0.makeCornerRound(radius: 3)
        }
        myInfo.do {
            $0.backgroundColor = .tvingGray5
            $0.makeCornerRound(radius: 3)
        }
        myInfoUseImage.do {
            $0.setImage(.usage, for: .normal)
        }
        myInfoUseLabel.do {
            $0.text = "나의 이용권"
            $0.textColor = .tvingGray4
            $0.font = .tvingMedium(ofSize: 13)
        }
        myInfoUseText.do {
            $0.text = "사용중인 이용권이 없습니다."
            $0.textColor = .tvingGray4
            $0.font = .tvingMedium(ofSize: 13)
        }
        myInfoCashImage.do {
            $0.setImage(.cash, for: .normal)
        }
        myInfoCashLabel.do {
            $0.text = "티빙캐시"
            $0.textColor = .tvingGray4
            $0.font = .tvingMedium(ofSize: 13)
        }
        myInfoCashText.do {
            $0.text = "0"
            $0.textColor = .white
            $0.font = .tvingBold(ofSize: 15)
        }
        someContents.do {
            $0.backgroundColor = .tvingGray5
            $0.makeCornerRound(radius: 3)
        }
        someContentsText2.do {
            $0.text = "다양한 영화 콘텐츠를 자유롭게 시청하세요!"
            $0.textColor = .tvingGray3
            $0.font = .tvingSemiBold(ofSize: 12)
        }
        arrowButton.do {
            $0.setImage(.arrowImage, for: .normal)
        }
    }
    
    private func setLayout() {
        contentView.addSubviews(
            profileImage,
            myName,
            changeProfile,
            myInfo,
            myInfoUseImage,
            myInfoUseLabel,
            myInfoUseText,
            myInfoCashImage,
            myInfoCashLabel,
            myInfoCashText,
            someContents,
            someContentsText1,
            someContentsText2,
            arrowButton
        )
        profileImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.leading.equalToSuperview().inset(24)
            $0.width.equalTo(72)
            $0.height.equalTo(74)
        }
        myName.snp.makeConstraints {
            $0.top.equalToSuperview().inset(57)
            $0.leading.equalToSuperview().inset(118)
            $0.centerY.equalTo(profileImage.snp.centerY)
        }
        changeProfile.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(21)
            $0.centerY.equalTo(myName.snp.centerY)
            $0.width.equalTo(70)
            $0.height.equalTo(25)
        }
        myInfo.snp.makeConstraints {
            $0.top.equalToSuperview().inset(138)
            $0.trailing.leading.equalToSuperview().inset(10)
            $0.height.equalTo(92)
        }
        myInfoUseImage.snp.makeConstraints {
            $0.top.equalTo(myInfo.snp.top).offset(18)
            $0.leading.equalTo(myInfo.snp.leading).offset(11)
            $0.size.equalTo(23)
        }
        myInfoUseLabel.snp.makeConstraints {
            $0.centerY.equalTo(myInfoUseImage.snp.centerY)
            $0.leading.equalTo(myInfoUseImage.snp.trailing).offset(5)
        }
        myInfoUseText.snp.makeConstraints {
            $0.centerY.equalTo(myInfoUseImage.snp.centerY)
            $0.trailing.equalTo(myInfo.snp.trailing).offset(-17)
        }
        myInfoCashImage.snp.makeConstraints {
            $0.top.equalTo(myInfo.snp.top).offset(58)
            $0.leading.equalTo(myInfo.snp.leading).offset(11)
            $0.size.equalTo(23)
        }
        myInfoCashLabel.snp.makeConstraints {
            $0.centerY.equalTo(myInfoCashImage.snp.centerY)
            $0.leading.equalTo(myInfoCashImage.snp.trailing).offset(5)
        }
        myInfoCashText.snp.makeConstraints {
            $0.centerY.equalTo(myInfoCashImage.snp.centerY)
            $0.trailing.equalTo(myInfo.snp.trailing).offset(-17)
        }
        someContents.snp.makeConstraints {
            $0.top.equalToSuperview().inset(242)
            $0.trailing.leading.equalToSuperview().inset(10)
            $0.height.equalTo(60)
        }
        someContentsText1.snp.makeConstraints {
            $0.top.equalTo(someContents.snp.top).offset(11)
            $0.leading.equalTo(someContents.snp.leading).offset(18)
        }
        someContentsText2.snp.makeConstraints {
            $0.top.equalTo(someContents.snp.top).offset(34)
            $0.leading.equalTo(someContents.snp.leading).offset(18)
        }
        arrowButton.snp.makeConstraints {
            $0.top.equalTo(someContents.snp.top).offset(20.64)
            $0.trailing.equalTo(someContents.snp.trailing).offset(-13)
        }
    }
}
