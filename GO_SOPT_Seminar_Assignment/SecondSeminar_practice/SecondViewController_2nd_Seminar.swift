//
//  SecondViewController_2nd_Seminar.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/10.
//

import UIKit

import SnapKit
import Then

protocol DataBindProtocol: AnyObject {
    func dataBind(count: Int)
}

final class SecondViewController_2nd_Seminar: UIViewController {
    
    private var count = 0
    weak var delegate: DataBindProtocol?
    
    private lazy var pushButton = UIButton().then{
        $0.setTitle("눌러줭", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.setTitleColor(.white, for: .normal)
        $0.makeCornerRound(radius : 20)
        $0.addTarget(self,
                     action: #selector(pushButtonAction),
                     for: .touchUpInside)
    }
    
    private lazy var backButton = UIButton().then{
        $0.setTitle("이전으로!", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.setTitleColor(.white, for: .normal)
        $0.makeCornerRound(radius : 20)
        $0.addTarget(self,
                     action: #selector(popSecondViewController),
                     for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
    }
    
}

private extension SecondViewController_2nd_Seminar {
    
    func style() {
        view.backgroundColor = .white
    }
    
    func setLayout() {
        view.addSubviews(pushButton, backButton)
        
        pushButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(300)
            $0.width.equalTo(200)
            $0.height.equalTo(50)
        }
        
        backButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(50)
            $0.top.equalTo(pushButton.snp.bottom).offset(40)
        }
    }
    
    @objc
    func pushButtonAction() {
        count += 1
        delegate?.dataBind(count: count)
    }
    
    @objc
    func popSecondViewController() {
        self.dismiss(animated: true)
    }
}

