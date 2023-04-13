//
//  SecondViewController_2nd_Assignment.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/13.
//

import UIKit

import SnapKit
import Then

// MARK: - SecurityProtocol

protocol SecurityProtocol: AnyObject {
    func nicknameData(text: String)
}

final class SecondViewController_2nd_Assignment: UIViewController {
    
    weak var delegate: SecurityProtocol?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
                
        style()
        setLayout()
    }
    
    // MARK: - UI Components
    
    private lazy var nicknameLabel = UILabel().then{
        $0.text = "닉네임을 입력해주세요"
        $0.textColor = .black
        $0.font = .tvingMedium(ofSize: 23)
    }
    
    private lazy var nicknameTextField = UITextField().then{
        $0.placeholder = "아요짱!!!"
        $0.font = .tvingSemiBold(ofSize: 15)
        $0.backgroundColor = .tvingGray3
        $0.textColor = .tvingGray2
        $0.setLeftPaddingPoints(24.64)
        $0.makeCornerRound(radius: 3)
        $0.addTarget(self, action: #selector(self.nicknameTextFieldChanged), for: .editingChanged)
    }
    
    private lazy var saveButton = UIButton().then{
        $0.setTitle("저장하기", for: .normal)
        $0.backgroundColor = .tvingRed
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .tvingSemiBold(ofSize: 14)
        $0.titleLabel?.textAlignment = .center
        $0.isEnabled = false
        $0.makeCornerRound(radius: 12)
        $0.addTarget(self, action: #selector(saveButtonTapped),
                     for: .touchUpInside)
    }
    
}

private extension SecondViewController_2nd_Assignment {
    
    // MARK: - style & layout

    func style() {
        view.backgroundColor = .white
    }
    
    func setLayout() {
        view.addSubviews(nicknameLabel, nicknameTextField, saveButton)
        
        nicknameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(45)
            $0.leading.equalToSuperview().offset(20)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(93)
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(52)
            $0.width.equalTo(335)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(359.19)
            $0.leading.equalToSuperview().offset(22.82)
            $0.height.equalTo(52)
            $0.width.equalTo(332.34)
        }
    }
    
    // MARK: - 저장하기 버튼 눌렀을 때 닉네임 데이터 넘겨주기
    
    @objc
    func saveButtonTapped() {
        if let text = nicknameTextField.text {
                    delegate?.nicknameData(text: text)
        }
        self.dismiss(animated: true)
    }
    
    // MARK: - nicknameTextField 이벤트감지함수
    
    @objc
    func nicknameTextFieldChanged() {
        if !(self.nicknameTextField.text?.isEmpty ?? true) {
            saveButton.isEnabled = true
        }
        
        if (self.nicknameTextField.text?.isEmpty ?? true) {
            saveButton.isEnabled = false
        }
        
        if (self.nicknameTextField.text?.isContainNumberAndAlphabet() ?? true) {
            nicknameTextField.resignFirstResponder()
            saveButton.isEnabled = false
        }
    }
}


