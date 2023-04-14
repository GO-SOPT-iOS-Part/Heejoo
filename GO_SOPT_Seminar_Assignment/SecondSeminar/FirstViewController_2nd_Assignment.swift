//
//  FirstViewController_2nd_Assignment.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/11.
//

import UIKit

import SnapKit
import Then

final class FirstViewController_2nd_Assignment: UIViewController, UISheetPresentationControllerDelegate {
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idTextField.delegate = self
        passwordTextField.delegate = self
        
        style()
        setLayout()
    }
    
    // MARK: - UI Components
    
    private let loginLabel = UILabel().then {
        $0.text = "TVING ID 로그인"
        $0.font = .tvingMedium(ofSize: 23)
        $0.textColor = .tvingGray
        $0.textAlignment = .center
    }
    
    private lazy var idTextField = UITextField().then {
        $0.placeholder = "아이디"
        $0.font = .tvingSemiBold(ofSize: 15)
        $0.backgroundColor = .tvingGray2
        $0.textColor = .tvingGray3
        $0.autocapitalizationType = .none
        $0.setLeftPaddingPoints(22)
        $0.setPlaceholderColor(.tvingGray3)
        $0.makeCornerRound(radius: 3)
    }
    
    private lazy var passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.font = .tvingSemiBold(ofSize: 15)
        $0.isSecureTextEntry = true
        $0.backgroundColor = .tvingGray2
        $0.textColor = .tvingGray3
        $0.setLeftPaddingPoints(22)
        $0.setPlaceholderColor(.tvingGray3)
        $0.makeCornerRound(radius: 3)
    }
    
    private let deleteIDButton = UIButton().then {
        $0.setImage(UIImage(named: "delete"), for: .normal)
        $0.isEnabled = false
        $0.isHidden = true
    }
    
    private let eyeButton = UIButton().then {
        $0.setImage(UIImage(named: "eye"), for: .normal)
        $0.isEnabled = false
        $0.isHidden = true
    }
    
    private let deletePasswordButton = UIButton().then {
        $0.setImage(UIImage(named: "delete"), for: .normal)
        $0.isEnabled = false
        $0.isHidden = true
    }
    
    private lazy var loginButton = UIButton().then {
        $0.setTitle("로그인하기", for: .normal)
        $0.backgroundColor = .black
        $0.setTitleColor(.tvingGray3, for: .normal)
        $0.titleLabel?.font = .tvingSemiBold(ofSize: 14)
        $0.titleLabel?.textAlignment = .center
        $0.makeBorder(width: 1, color: .tvingGray3)
        $0.makeCornerRound(radius: 3)
        $0.addTarget(self,
                     action: #selector(loginButtonTapped),
                     for: .touchUpInside)
    }
    
    private lazy var whereIDButton = UIButton().then {
        $0.setTitle("아이디 찾기", for: .normal)
        $0.backgroundColor = .black
        $0.setTitleColor(.tvingGray3, for: .normal)
        $0.titleLabel?.font = .tvingSemiBold(ofSize: 14)
        $0.titleLabel?.textAlignment = .center
    }
    
    private lazy var wherePasswordButton = UIButton().then {
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.backgroundColor = .black
        $0.setTitleColor(.tvingGray3, for: .normal)
        $0.titleLabel?.font = .tvingSemiBold(ofSize: 14)
        $0.titleLabel?.textAlignment = .center
    }
    
    private let barLabel = UILabel().then {
        $0.text = "|"
        $0.textColor = .tvingGray2
    }
    
    private let yetLabel = UILabel().then {
        $0.text = "아직 계정이 없으신가요?"
        $0.textColor = .tvingGray4
        $0.font = .tvingSemiBold(ofSize: 14)
    }
    
    private lazy var makeIDButton = UIButton().then {
        $0.setTitle("닉네임 만들러가기", for: .normal)
        $0.backgroundColor = .black
        $0.setTitleColor(.tvingGray3, for: .normal)
        $0.titleLabel?.font = .tvingRegular(ofSize: 14)
        $0.titleLabel?.textAlignment = .center
        $0.setUnderline()
        $0.addTarget(self,
                     action: #selector(nicknameButtonTapped),
                     for: .touchUpInside)
    }
    
    private lazy var backButton = UIButton().then {
        $0.setImage(UIImage(named: "arrow"), for: .normal)
    }
    
    private lazy var nicknameTextField = UITextField().then {
        $0.text = ""
    }
}

private extension FirstViewController_2nd_Assignment {
    
    // MARK: - style & layout
    
    func style() {
        view.backgroundColor = .black
    }
    
    func setLayout() {
        view.addSubviews(
            loginLabel,
            idTextField,
            passwordTextField,
            eyeButton,
            deleteIDButton,
            deletePasswordButton,
            loginButton,
            whereIDButton,
            wherePasswordButton,
            barLabel,
            yetLabel,
            makeIDButton,
            backButton
        )
        
        loginLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(90)
        }
        
        idTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginLabel.snp.bottom).offset(31)
            $0.height.equalTo(52)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        deleteIDButton.snp.makeConstraints {
            $0.centerY.equalTo(idTextField.snp.centerY)
            $0.trailing.equalTo(passwordTextField.snp.trailing).offset(-14)
            $0.size.equalTo(20)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.height.equalTo(52)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        eyeButton.snp.makeConstraints {
            $0.centerY.equalTo(passwordTextField.snp.centerY)
            $0.trailing.equalTo(passwordTextField.snp.trailing).offset(-14)
            $0.size.equalTo(20)
        }
        
        deletePasswordButton.snp.makeConstraints {
            $0.centerY.equalTo(passwordTextField.snp.centerY)
            $0.trailing.equalTo(passwordTextField.snp.trailing).offset(-56)
            $0.size.equalTo(20)
        }
        
        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordTextField.snp.bottom).offset(21)
            $0.height.equalTo(52)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        whereIDButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(373)
            $0.leading.equalTo(85)
        }
        
        wherePasswordButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(373)
            $0.leading.equalTo(whereIDButton.snp.trailing).offset(80)
        }
        
        barLabel.snp.makeConstraints {
            $0.centerY.equalTo(whereIDButton.snp.centerY)
            $0.leading.equalTo(whereIDButton.snp.trailing).offset(40)
        }
        
        yetLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(423)
            $0.leading.equalToSuperview().offset(51)
        }
        
        makeIDButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(423)
            $0.centerY.equalTo(yetLabel.snp.centerY)
            $0.leading.equalTo(yetLabel.snp.trailing).offset(42)
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(65)
            $0.leading.equalToSuperview().offset(19)
            $0.height.equalTo(15)
            $0.width.equalTo(8)
        }
    }
    
    // MARK: - 로그인 가능 조건
    
    func canLogin() {
        let tOrf = idTextField.hasText && passwordTextField.hasText
        updateLoginButton(willActive: tOrf)
    }
    
    // MARK: - 로그인버튼 활성화 or 비활성화
    
    func updateLoginButton(willActive: Bool) {
        if willActive {
            setLoginButton(color: .tvingRed, width: 0, tOrf: true)
            loginButton.setTitleColor(.white, for: .normal)
        } else {
            setLoginButton(color: .black, width: 1, tOrf: false)
            loginButton.setTitleColor(.tvingGray3, for: .normal)
        }
    }
    
    // MARK: - 로그인버튼 활성화 or 비활성화일 때 특성 주는 함수
    
    func setLoginButton(color: UIColor, width: CGFloat, tOrf: Bool) {
        loginButton.backgroundColor = color
        loginButton.makeBorder(width: width, color: .tvingGray3)
        loginButton.isEnabled = tOrf
    }
    
    // MARK: - eyeButton & deleteButton
    
    func whenIdInput() {
        eyeButton.isHidden = true
        eyeButton.isEnabled = false
        deletePasswordButton.isHidden = true
        deletePasswordButton.isEnabled = false
        
        deleteIDButton.isHidden = false
        deleteIDButton.isEnabled = true
        deleteIDButton.addTarget(self, action: #selector(deleteIdButtonTapped), for: .touchUpInside)
    }
    
    func whenPasswordInput() {
        deleteIDButton.isHidden = true
        deleteIDButton.isEnabled = false

        eyeButton.isHidden = false
        eyeButton.isEnabled = true
        eyeButton.addTarget(self, action: #selector(eyeButtonTapped), for: .touchUpInside)
        
        deletePasswordButton.isHidden = false
        deletePasswordButton.isEnabled = true
        deletePasswordButton.addTarget(self, action: #selector(deletePasswordButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func eyeButtonTapped() {
        if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry = false
        } else {
            passwordTextField.isSecureTextEntry = true
        }
    }
    
    @objc
    func deleteIdButtonTapped() {
        idTextField.text = ""
        canLogin()
    }
    
    @objc
    func deletePasswordButtonTapped() {
        passwordTextField.text = ""
        canLogin()
    }
    
    // MARK: - login 버튼 눌렀을 때
    
    @objc
    func loginButtonTapped() {
        lazy var text = nicknameTextField.text
        if (self.nicknameTextField.text?.isEmpty ?? true) {
            text = idTextField.text
        }
        let ThirdViewController = ThirdViewController_2nd_Assignment()
        ThirdViewController.text = text
        ThirdViewController.modalPresentationStyle = .fullScreen
        self.present(ThirdViewController, animated: true)
        passwordTextField.makeBorder(width: 0, color: .tvingGray3)
    }
    
    // MARK: - nickname 버튼 눌렀을 때
    
    @objc
    func nicknameButtonTapped() {
        let secondViewController = SecondViewController_2nd_Assignment()
        secondViewController.delegate = self
        secondViewController.modalPresentationStyle = .pageSheet
        if let sheet = secondViewController.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.delegate = self
            sheet.prefersGrabberVisible = true
        }
        present(secondViewController, animated: true)
    }
}

// MARK: - 프로토콜 상속

extension FirstViewController_2nd_Assignment: SecurityProtocol {
    
    func nicknameData(text: String) {
        nicknameTextField.text = text
    }
}

// MARK: - UITextFieldDelegate

extension FirstViewController_2nd_Assignment: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.makeBorder(width : 1, color : .tvingGray3)
        canLogin()
        if textField == idTextField {
            whenIdInput()
        } else {
            whenPasswordInput()
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        canLogin()
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.makeBorder(width: 0, color: .tvingGray3)
        canLogin()
    }
}
