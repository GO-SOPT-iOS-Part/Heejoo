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
        
        style()
        setLayout()
    }
    
    // MARK: - UI Components
    
    private lazy var loginLabel = UILabel().then{
        $0.text = "TIVING ID 로그인"
        $0.font = .tvingMedium(ofSize: 23)
        $0.textColor = .tvingGray
        $0.textAlignment = .center
    }
    
    private lazy var idTextField = UITextField().then{
        $0.placeholder = "아이디"
        $0.font = .tvingSemiBold(ofSize: 15)
        $0.backgroundColor = .tvingGray2
        $0.textColor = .tvingGray3
        $0.autocapitalizationType = .none
        $0.setLeftPaddingPoints(22)
        $0.setPlaceholderColor(.tvingGray3)
        $0.makeCornerRound(radius: 3)
        $0.addTarget(self, action: #selector(self.idTextFieldTouchDown), for: .touchDown)
        $0.addTarget(self, action: #selector(self.idTextFieldChanged), for: .editingChanged)
        $0.addTarget(self, action: #selector(self.idTextFieldDidEnd), for: .editingDidEnd)
    }
    
    private lazy var passwordTextField = UITextField().then{
        $0.placeholder = "비밀번호"
        $0.font = .tvingSemiBold(ofSize: 15)
        $0.isSecureTextEntry = true
        $0.backgroundColor = .tvingGray2
        $0.textColor = .tvingGray3
        $0.setLeftPaddingPoints(22)
        $0.setPlaceholderColor(.tvingGray3)
        $0.makeCornerRound(radius: 3)
        $0.addTarget(self, action: #selector(self.passwordTextFieldTouchDown), for: .touchDown)
        $0.addTarget(self, action: #selector(self.passwordTextFieldChanged), for: .editingChanged)
        $0.addTarget(self, action: #selector(self.passwordTextFieldDidEnd), for: .editingDidEnd)
    }
    
    private lazy var deleteIDButton = UIButton().then{
        $0.isEnabled = false
    }
    
    private lazy var eyeButton = UIButton().then{
        $0.isEnabled = false
    }
    
    private lazy var deletePasswordButton = UIButton().then{
        $0.isEnabled = false
    }
    
    private lazy var loginButton = UIButton().then{
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
    
    private lazy var whereIDButton = UIButton().then{
        $0.setTitle("아이디 찾기", for: .normal)
        $0.backgroundColor = .black
        $0.setTitleColor(.tvingGray3, for: .normal)
        $0.titleLabel?.font = .tvingSemiBold(ofSize: 14)
        $0.titleLabel?.textAlignment = .center
    }
    
    private lazy var wherePasswordButton = UIButton().then{
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.backgroundColor = .black
        $0.setTitleColor(.tvingGray3, for: .normal)
        $0.titleLabel?.font = .tvingSemiBold(ofSize: 14)
        $0.titleLabel?.textAlignment = .center
    }
    
    private let barLabel = UILabel().then{
        $0.text = "|"
        $0.textColor = .tvingGray2
    }
    
    private let yetLabel = UILabel().then{
        $0.text = "아직 계정이 없으신가요?"
        $0.textColor = .tvingGray4
        $0.font = .tvingSemiBold(ofSize: 14)
    }
    
    private lazy var makeIDButton = UIButton().then{
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
    
    private lazy var backButton = UIButton().then{
        $0.setImage(UIImage(named: "arrow"), for: .normal)
    }
    
    private lazy var nicknameTextField = UITextField().then{
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
            $0.top.equalToSuperview().offset(90)
        }
        
        idTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginLabel.snp.bottom).offset(31)
            $0.height.equalTo(52)
            $0.width.equalTo(335)
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
            $0.width.equalTo(335)
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
            $0.width.equalTo(335)
        }
        
        whereIDButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(373)
            $0.leading.equalTo(85)
        }
        
        wherePasswordButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(373)
            $0.leading.equalTo(whereIDButton.snp.trailing).offset(80)
        }
        
        barLabel.snp.makeConstraints {
            $0.centerY.equalTo(whereIDButton.snp.centerY)
            $0.leading.equalTo(whereIDButton.snp.trailing).offset(40)
        }
        
        yetLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(423)
            $0.leading.equalToSuperview().offset(51)
        }
        
        makeIDButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(423)
            $0.centerY.equalTo(yetLabel.snp.centerY)
            $0.leading.equalTo(yetLabel.snp.trailing).offset(42)
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(65)
            $0.leading.equalToSuperview().offset(19)
            $0.height.equalTo(15)
            $0.width.equalTo(8)
        }
    }
    
    // MARK: - idTextField 이벤트감지함수
    
    @objc
    func idTextFieldTouchDown() {
        idTextField.makeBorder(width : 1, color : .tvingGray3)
        deleteIDButton.isHidden = false
        deleteIDButton.isEnabled = true
        deleteIDButton.setImage(UIImage(named: "delete"), for: .normal)
        deleteIDButton.addTarget(self, action: #selector(deleteIdButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func idTextFieldChanged() {
        if !(self.idTextField.text?.isEmpty ?? true)
            && !(self.passwordTextField.text?.isEmpty ?? true) {
            updateLoginButton(willActive: true)
        }
        else {
            updateLoginButton(willActive: false)
        }
    }
    
    @objc
    func idTextFieldDidEnd() {
        idTextField.makeBorder(width: 0, color: .tvingGray3)
        deleteIDButton.isHidden = true
    }
    
    // MARK: - passwordTextField 이벤트감지함수
    
    @objc
    func passwordTextFieldTouchDown() {
        passwordTextField.makeBorder(width : 1, color : .tvingGray3)
        eyeButton.isHidden = false
        eyeButton.isEnabled = true
        eyeButton.addTarget(self, action: #selector(eyeButtonTapped), for: .touchUpInside)
        eyeButton.setImage(UIImage(named: "eye"), for: .normal)
        deletePasswordButton.isHidden = false
        deletePasswordButton.isEnabled = true
        deletePasswordButton.addTarget(self, action: #selector(deletePasswordButtonTapped), for: .touchUpInside)
        deletePasswordButton.setImage(UIImage(named: "delete"), for: .normal)
    }
    
    @objc
    func passwordTextFieldChanged() {
        if !(self.idTextField.text?.isEmpty ?? true)
            && !(self.passwordTextField.text?.isEmpty ?? true) {
            updateLoginButton(willActive: true)
        } else {
            updateLoginButton(willActive: false)
        }
    }
    
    @objc
    func passwordTextFieldDidEnd() {
        passwordTextField.makeBorder(width: 0, color: .tvingGray3)
        deletePasswordButton.isHidden = true
        eyeButton.isHidden = true
    }
    
    // MARK: - 로그인버튼이 활성화될 조건
    
    func updateLoginButton(willActive: Bool) {
        if (willActive == true) {
            loginButton.backgroundColor = .tvingRed
            loginButton.setTitleColor(.white, for: .normal)
            loginButton.makeBorder(width: 0, color: .tvingGray3)
        } else {
            loginButton.backgroundColor = .black
            loginButton.setTitleColor(.tvingGray3, for: .normal)
            loginButton.makeBorder(width: 1, color: .tvingGray3)
        }
    }
    
    // MARK: - eyeButton & deleteButton
    
    @objc
    func eyeButtonTapped() {
        if (passwordTextField.isSecureTextEntry == true) {
            passwordTextField.isSecureTextEntry = false
        } else {
            passwordTextField.isSecureTextEntry = true
        }
    }
    
    @objc
    func deleteIdButtonTapped() {
        idTextField.text = ""
    }
    
    @objc
    func deletePasswordButtonTapped() {
        passwordTextField.text = ""
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
