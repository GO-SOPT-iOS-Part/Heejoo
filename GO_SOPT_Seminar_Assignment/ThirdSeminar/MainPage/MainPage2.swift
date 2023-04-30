//
//  MainPage2.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/30.
//

import UIKit

struct MainPage2 {
    let image: UIImage
    let number: String
    let broadcaster: String
    let program: String
    let rating: String
}

extension MainPage2 {
    static func dummy2() -> [MainPage2] {
        return [MainPage2(image: .yellow,
                          number: "1",
                          broadcaster: "Mnet",
                          program: "보이즈 플래닛 12화",
                          rating: "80.0%"),
                MainPage2(image: .blue,
                         number: "2",
                         broadcaster: "Mnet",
                         program: "하트시그널 4화",
                         rating: "24.1%"),
                MainPage2(image: .yellow,
                          number: "3",
                          broadcaster: "tvN",
                          program: "코미디빅리그 498화",
                          rating: "11.1%"),
                MainPage2(image: .blue,
                          number: "4",
                          broadcaster: "OCN",
                          program: "007 노 타임 투 다이",
                          rating: "16.7%")]}
}
