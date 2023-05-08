//
//  Navigation.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/05/02.
//

import UIKit

struct Navigation {
    let navigation: String
}

extension Navigation {
    static func dummy() -> [Navigation] {
        return [Navigation(navigation: "홈"),
                Navigation(navigation: "실시간"),
                Navigation(navigation: "TV 프로그램"),
                Navigation(navigation: "영화"),
                Navigation(navigation: "파라마운트+"),
                Navigation(navigation: "키즈")]}
}

