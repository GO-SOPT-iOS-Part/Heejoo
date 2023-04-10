//
//  FirstViewController_2nd_Seminar.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/10.
//

import UIKit
import Then
import SnapKit

final class FirstViewController_2nd_Seminar: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
    }
    
    private lazy var countLabel = UILabel().then {
        $0.text = "횟수는?"
        $0.font = .systemFont(ofSize: 30)
        $0.textColor = .blue
        $0.textAlignment = .center
    }
    
    private lazy var nextButton = UIButton().then{
        $0.setTitle("누르러가기!", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 20
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
        
        [countLabel, nextButton].forEach {
                    $0.translatesAutoresizingMaskIntoConstraints = false
                    view.addSubview($0)
                }
        
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
        if count > 9 {
            countLabel.text = "10을 넘었엉 " + String(count) + "번이야 !! "
        }
        else {
            countLabel.text = "조금 더 눌러봥 아직 " + String(count) + "번이야 !!"
        }
    }
}
