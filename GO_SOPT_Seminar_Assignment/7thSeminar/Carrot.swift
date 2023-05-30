//
//  Carrot.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/05/29.
//

import UIKit

struct Carrot {
    let image: UIImage
    let title: String
    let place: String
    let time: String
    let tradeStatus: Trade
    var likeTapped: Bool
    let price: Int
}

extension Carrot {
    
    static func dummy() -> [Carrot] {
        return [Carrot(image: .hypeBoy,
                       title: "에어팟 프로 2",
                       place: "하계 2동",
                       time: "일주일 전",
                       tradeStatus: .completed,
                       likeTapped: false,
                       price: 200000),
                Carrot(image: .hypeBoy,
                       title:
                        "아이폰 5",
                       place: "공릉 2동",
                       time: "4월 2일",
                       tradeStatus: .reservation,
                       likeTapped: false,
                       price: 100000),
                Carrot(image: .hypeBoy,
                       title:
                        "아이폰 5",
                       place: "공릉 2동",
                       time: "1일 전",
                       tradeStatus: .shared,
                       likeTapped: false,
                       price: 100000),
                Carrot(image: .hypeBoy,
                       title:
                        "아이폰 5",
                       place: "중계 2동",
                       time: "6시간 전",
                       tradeStatus: .completed,
                       likeTapped: false,
                       price: 100000),
                Carrot(image: .hypeBoy,
                       title:
                        "아이폰 5",
                       place: "중계 2동",
                       time: "3시간 전",
                       tradeStatus: .clear,
                       likeTapped: false,
                       price: 100000)
                ,
                Carrot(image: .hypeBoy,
                       title:
                        "아이폰 5",
                       place: "중계 2동",
                       time: "4월 3일",
                       tradeStatus: .completed,
                       likeTapped: false,
                       price: 100000)
                ,
                Carrot(image: .hypeBoy,
                       title:
                        "아이폰 5",
                       place: "중계 2동",
                       time: "3월 31일",
                       tradeStatus: .reservation,
                       likeTapped: false,
                       price: 1000)]
    }
}
