//
//  ViewController.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/07.
//

import UIKit

final class FirstViewController_1st_Assignment : UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름이 무엇입니까?"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .center
        label.shadowColor = .gray
        label.shadowOffset = CGSize(width: 5, height: 5)
        //label 속성에 그림자 추가
        label.highlightedTextColor = .blue
        label.isHighlighted = true
        //label 속성에 하이라이트 추가 -> textcolor을 검정색에서 파란색으로 바꿈
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력해주세요"
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        textField.allowsEditingTextAttributes = true
        //사용자가 텍스트 필드에서 텍스트 속성을 편집할 수 있게 해주는 속성 추가
        textField.clearsOnInsertion = true
        //텍스트 삽입이 이전 내용을 대체할지 여부를 결정하는 속성 추가
        return textField
    }()
    
    private lazy var presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("present!", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self,
                         action: #selector(presentButtonTapped),
                         for: .touchUpInside)
        
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.systemGray.cgColor
        //버튼에 테두리 속성 추가
        return button
    }()
    
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("push!", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self,
                         action: #selector(pushButtonTapped),
                         for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        //버튼 제목의 글씨크기 변경
        button.layer.cornerRadius = 20
        //버튼 테두리를 둥글게 (값이 커질수록 둥글둥글)
        //button.contentHorizontalAlignment = .left
        //버튼 제목을 왼쪽 정렬
        return button
    }()
    
    private lazy var myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "SOPT_iOS.png")
        return imageView
    }()  //UIImageView 컴포넌트 추가 + 속성 부여
    
    private lazy var mySwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.setOn(true, animated: true)
        mySwitch.addTarget(self, action: #selector(switchOnOff(_:)), for: .valueChanged)
        return mySwitch
    }()  //UISwitch 컴포넌트 추가 + 속성 부여
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
    }
    
}

private extension FirstViewController_1st_Assignment {
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [nameLabel, nameTextField,
         presentButton, pushButton, myImageView, mySwitch].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 230),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     nameTextField.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([presentButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                                     presentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     presentButton.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([pushButton.topAnchor.constraint(equalTo: presentButton.bottomAnchor, constant: 20),
                                     pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     pushButton.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([myImageView.topAnchor.constraint(equalTo: pushButton.bottomAnchor, constant: 20),
                                     myImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     myImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     myImageView.heightAnchor.constraint(equalToConstant: 180)])
        NSLayoutConstraint.activate([mySwitch.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 20),
                                     mySwitch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 160),
                                     mySwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -160),
                                     mySwitch.heightAnchor.constraint(equalToConstant: 48)])
    }
    
    func presentToSecondViewController() {
        
        guard let name = nameTextField.text else { return }
        let secondViewController = SecondViewController_1st_Assignment()
        secondViewController.name = name
        secondViewController.modalPresentationStyle = .fullScreen
        self.present(secondViewController, animated: true)
    }
    
    func pushToSecondViewController() {
        
        guard let name = nameTextField.text else { return }
        let secondViewController = SecondViewController_1st_Assignment()
        secondViewController.name = name
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @objc
    func presentButtonTapped() {
        
        presentToSecondViewController()
    }
    
    @objc
    func pushButtonTapped() {
        
        pushToSecondViewController()
    }
    
    @objc func switchOnOff(_ sender:UISwitch){
        
        self.myImageView.image = (sender.isOn == true ? UIImage(named: "SOPT_iOS"): UIImage(named: "거꾸로"))
    }
    
}



