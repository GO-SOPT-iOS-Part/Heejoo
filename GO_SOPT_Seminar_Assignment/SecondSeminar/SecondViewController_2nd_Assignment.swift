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
        
        nicknameTextField.delegate = self
        
        style()
        setLayout()
    }
    
    // MARK: - UI Components
    
    private lazy var nicknameLabel = UILabel().then {
        $0.text = "닉네임을 입력해주세요"
        $0.textColor = .black
        $0.font = .tvingMedium(ofSize: 23)
    }
    
    private lazy var nicknameTextField = UITextField().then {
        $0.placeholder = "아요짱!!!"
        $0.font = .tvingSemiBold(ofSize: 15)
        $0.backgroundColor = .tvingGray3
        $0.textColor = .tvingGray2
        $0.setLeftPaddingPoints(24.64)
        $0.makeCornerRound(radius: 3)
    }
    
    private let deleteButton = UIButton().then {
        $0.setImage(UIImage(named: "delete"), for: .normal)
        $0.isEnabled = false
        $0.isHidden = true
    }
    
    private lazy var saveButton = UIButton().then {
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
        view.addSubviews(
            nicknameLabel,
            nicknameTextField,
            deleteButton,
            saveButton
        )
        
        nicknameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(45)
            $0.leading.equalToSuperview().offset(20)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(93)
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(52)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        deleteButton.snp.makeConstraints {
            $0.centerY.equalTo(nicknameTextField.snp.centerY)
            $0.trailing.equalTo(nicknameTextField.snp.trailing).offset(-14)
            $0.size.equalTo(20)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(359.19)
            $0.height.equalTo(52)
            $0.leading.equalToSuperview().inset(22.82)
            $0.trailing.equalToSuperview().inset(22.82)
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
    
    // MARK: - 정규식 사용하여 textField 저장 가능 판별
    
    func saveButtonEnabled(_ textField: UITextField) {
        if textField.text!.isOnlyKorean() {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
    
    // MARK: - deleteButton 추가
    
    @objc
    func deleteButtonTapped() {
        nicknameTextField.text = ""
        saveButtonEnabled(nicknameTextField)
    }
}

// MARK: - UITextFieldDelegate

extension SecondViewController_2nd_Assignment: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButtonEnabled(textField)
        deleteButton.isHidden = false
        deleteButton.isEnabled = true
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        saveButtonEnabled(textField)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        saveButtonEnabled(textField)
    }
}




