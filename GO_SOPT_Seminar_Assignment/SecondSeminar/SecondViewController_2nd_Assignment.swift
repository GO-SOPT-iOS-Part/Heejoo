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
                
        setDelegate()
        style()
        setLayout()
    }
    
    // MARK: - 바텀시트 dismiss
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first,
           touch.view == self.view {
            self.dismiss(animated: true)
        }
    }
    
    // MARK: - UI Components
    
    private let bar = UIButton().then {
        $0.setImage(UIImage(named: "bar"), for: .normal)
    }
    
    private let firstView = UIView().then {
        $0.backgroundColor = .white
        $0.makeCornerRound(radius: 20)
    }
    
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
        $0.titleLabel?.font = .tvingSemiBold(ofSize: 14)
        $0.titleLabel?.textAlignment = .center
        $0.isEnabled = false
        $0.backgroundColor = .black
        $0.setTitleColor(.tvingGray3, for: .normal)
        $0.makeCornerRound(radius: 12)
        $0.addTarget(self, action: #selector(saveButtonTapped),
                     for: .touchUpInside)
    }
    
    // MARK: - BottomSheet
    
    func presentBottomSheet(height: CGFloat) {
        
        UIView.animate(withDuration: 0.3) { [weak self] in
            
            guard let self else { return }
            
            self.firstView.snp.updateConstraints {
                
                $0.height.equalTo(height)
                $0.leading.trailing.bottom.equalToSuperview()
            }
            
            self.view.layoutIfNeeded()
        }
    }
}

private extension SecondViewController_2nd_Assignment {
    
    // MARK: - style & layout
    
    func style() {
        view.backgroundColor = UIColor(white: 0.1, alpha: 0.5)
    }
    
    func setLayout() {
        view.addSubviews(bar, firstView)
        
        firstView.addSubviews(
            nicknameLabel,
            nicknameTextField,
            deleteButton,
            saveButton
        )
        
        bar.snp.makeConstraints {
            $0.bottom.equalTo(firstView.snp.top).offset(-15)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(7)
            $0.width.equalTo(56)
        }
        
        firstView.snp.makeConstraints {
            $0.height.equalTo(0)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaInsets)
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(45)
            $0.leading.equalToSuperview().inset(20)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(93)
            $0.height.equalTo(52)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        deleteButton.snp.makeConstraints {
            $0.centerY.equalTo(nicknameTextField.snp.centerY)
            $0.trailing.equalTo(nicknameTextField.snp.trailing).offset(-14)
            $0.size.equalTo(20)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(347.89)
            $0.height.equalTo(52)
            $0.leading.trailing.equalToSuperview().inset(22.82)
        }
    }
    
    // MARK: - setDelegate()
    
    func setDelegate() {
        nicknameTextField.delegate = self
    }
    
    // MARK: - 저장 버튼 활성화
    
    func saveButtonEnabled() {
        saveButton.isEnabled = true
        saveButton.backgroundColor = .tvingRed
        saveButton.setTitleColor(.white, for: .normal)
    }
    
    // MARK: - 저장 버튼 비활성화
    
    func saveButtonDisabled() {
        saveButton.isEnabled = false
        saveButton.backgroundColor = .black
        saveButton.setTitleColor(UIColor.tvingGray3, for: .normal)
    }
    
    // MARK: - 저장하기 버튼 눌렀을 때 닉네임 데이터 넘겨주기
    
    @objc
    func saveButtonTapped() {
        if let text = nicknameTextField.text {
            delegate?.nicknameData(text: text)
        }
        self.dismiss(animated: true)
    }
    
    // MARK: - deleteButton 추가
    
    @objc
    func deleteButtonTapped() {
        nicknameTextField.text = ""
        saveButtonDisabled()
    }
}

// MARK: - UITextFieldDelegate

extension SecondViewController_2nd_Assignment: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        deleteButton.isHidden = false
        deleteButton.isEnabled = true
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        if currentText.isOnlyKorean() && textField.hasText {
            if updatedText.isEmpty {
                saveButtonDisabled()
            } else {
                saveButtonEnabled()
            }
        }
        
        return updatedText.isOnlyKorean()
    }
}




