//
//  FirstViewController_2nd_Seminar.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/10.
//

import UIKit

import SnapKit
import Then

final class FirstViewController_2nd_Seminar: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
    }
    
    private lazy var countLabel = UILabel().then {
        $0.text = "횟수는 ???"
        $0.font = .systemFont(ofSize: 30)
        $0.textColor = .blue
        $0.textAlignment = .center
        $0.asColor(targetString: "???", color: UIColor.red)
    }
    
    private lazy var nextButton = UIButton().then{
        $0.setTitle("누르러가기!", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.makeCornerRound(radius : 20)
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self,
                     action: #selector(presentButtonTapped),
                     for: .touchUpInside)
    }
}

private extension FirstViewController_2nd_Seminar {
    
    func style() {
        view.backgroundColor = .white
    }
    
    func setLayout() {
        view.addSubviews(countLabel, nextButton)
        
        countLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(350)
        }
        
        nextButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(50)
            $0.top.equalTo(countLabel.snp.bottom).offset(50)
        }
        
    }
    
    func presentToSecondViewController() {
        let secondViewController = SecondViewController_2nd_Seminar()
        secondViewController.delegate = self
        self.present(secondViewController, animated: true)
    }
    
    @objc
    func presentButtonTapped() {
        presentToSecondViewController()
    }
}

extension FirstViewController_2nd_Seminar: DataBindProtocol {
    
    func dataBind(count: Int) {
        self.countLabel.text = (count > 10 ? "10번을 넘었엉 \(count)번이야!!" : "조금 더 눌러봥 아직 \(count)번이야 !!")
    }
}
