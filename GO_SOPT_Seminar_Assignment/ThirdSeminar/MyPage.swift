//
//  MyPage.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/04/26.
//

import UIKit

struct MyPage {
    let information: String
    let image: UIImage
}

extension MyPage {
    
    static func dummy1() -> [MyPage] {
        return [MyPage(information: "이용권",
                       image: .arrowImage ),
                MyPage(information: "1:1 문의내역",
                       image: .arrowImage ),
                MyPage(information: "예약알림",
                       image: .arrowImage ),
                MyPage(information: "회원정보 수정",
                       image: .arrowImage ),
                MyPage(information: "프로모션 정보 수신 동의",
                       image: .arrowImage )]
    }
    
    static func dummy2() -> [MyPage] {
        return [MyPage(information: "공지사항",
                       image: .arrowImage ),
                MyPage(information: "이벤트",
                       image: .arrowImage ),
                MyPage(information: "고객센터",
                       image: .arrowImage ),
                MyPage(information: "티빙 알아보기",
                       image: .arrowImage )]
    }

}

