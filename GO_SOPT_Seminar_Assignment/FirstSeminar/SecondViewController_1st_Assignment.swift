//
//  SecondViewController_1st_Assignment.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/07.
//

import UIKit

final class SecondViewController_1st_Assignment: UIViewController {
    
    var name: String?
    
    private let iOSLabel: UILabel = {
        let label = UILabel()
        label.text = "iOS"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .systemBlue
        label.textAlignment = .center
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "제 이름은 뭘까용?!"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .systemGray
        //label 속성에 색상 추가
        label.textAlignment = .center
        //label 가운데 정렬
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("뒤로가기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self,
                         action: #selector(backButtonTapped),
                         for: .touchUpInside)
        
        button.backgroundColor = .systemGray
        //버튼 속성에 배경색 추가
        return button
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataBind()
        style()
        setLayout()
    }
    
    func dataBind() {
        nameLabel.text = name
    }
    
}

private extension SecondViewController_1st_Assignment {
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout()
    {
        [iOSLabel, nameLabel, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([iOSLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
                                     iOSLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                      iOSLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: iOSLabel.bottomAnchor, constant: 20),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     nameLabel.heightAnchor.constraint(equalToConstant: 48)])
        
        
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     backButton.heightAnchor.constraint(equalToConstant: 48)])
    }
    
    @objc
    func backButtonTapped() {
        
        if self.navigationController == nil {
            self.dismiss(animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

