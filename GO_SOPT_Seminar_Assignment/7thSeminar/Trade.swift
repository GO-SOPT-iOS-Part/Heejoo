//
//  Trade.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/05/29.
//

import UIKit

@frozen
enum Trade {
    case reservation
    case completed
    case shared
    case clear
    
    var title: String {
        switch self {
        case .reservation:
            return "예약중"
        case .completed:
            return "거래완료"
        case .shared:
            return "나눔완료"
        case .clear:
            return ""
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .reservation:
            return .systemGreen
        case .completed:
            return .black
        case .shared:
            return .gray
        case .clear:
            return .white
        }
    }
}

