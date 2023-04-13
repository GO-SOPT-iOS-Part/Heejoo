//
//  SecondViewController_2nd_Assignment.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/12.
//

import UIKit

import SnapKit
import Then

final class ThirdViewController_2nd_Assignment: UIViewController {
    
    public var text: String?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        idData()
        style()
        setLayout()
    }
    
    // MARK: - UI Components
    
    private let tvingImage = UIImageView().then{
        $0.image = UIImage(named: "image.png")
    }
    
    private lazy var welcomeLabel = UILabel().then{
        $0.font = .tvingBold(ofSize: 23)
        $0.textColor = .white
    }
    
    private lazy var mainButton = UIButton().then{
        $0.setTitle("메인으로", for: .normal)
        $0.backgroundColor = .tvingRed
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .tvingSemiBold(ofSize: 14)
        $0.titleLabel?.textAlignment = .center
        $0.makeCornerRound(radius: 3)
    }
    
    // MARK: - 아이디 데이터 받아오기
    
    func idData() {
        welcomeLabel.text = text! + " 님\n반가워요!"
        welcomeLabel.numberOfLines = 2
        let attrString = NSMutableAttributedString(string: welcomeLabel.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.33
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        welcomeLabel.attributedText = attrString
        welcomeLabel.textAlignment = .center
    }
}

private extension ThirdViewController_2nd_Assignment {
    
    // MARK: - style & layout

    func style() {
        view.backgroundColor = .black
    }
    
    func setLayout() {
        view.addSubviews(tvingImage, welcomeLabel, mainButton)
        
        tvingImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(58)
            $0.width.equalTo(375)
            $0.height.equalTo(210.94)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(336)
        }
        
        mainButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-66)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(52)
            $0.width.equalTo(335)
        }
    }
}
