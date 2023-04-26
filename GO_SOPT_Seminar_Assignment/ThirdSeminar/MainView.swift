//
//  MainView.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/26.
//

import UIKit

import SnapKit
import Then

final class MainView: BaseView {

    let myPageButton = UIButton()
    
    override func setStyle() {
        myPageButton.do {
            $0.setTitle("마이페이지로!", for: .normal)
            $0.backgroundColor = .tvingGray3
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .tvingSemiBold(ofSize: 14)
            $0.titleLabel?.textAlignment = .center
            $0.makeBorder(width: 1, color: .tvingGray3)
            $0.makeCornerRound(radius: 3)
        }
    }
 
    override func setLayout() {
        addSubview(myPageButton)
        
        myPageButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(60)
            $0.height.equalTo(50)
        }
    }
   
}
