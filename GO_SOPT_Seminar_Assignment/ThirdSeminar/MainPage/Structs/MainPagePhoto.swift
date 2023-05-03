//
//  MainPagePhoto.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/05/01.
//

import UIKit

struct MainPagePhoto {
    let image: UIImage
}

extension MainPagePhoto {
    static func dummy() -> [MainPagePhoto] {
        var photos: [MainPagePhoto] = []
        for number in 1...4 {
            photos.append(MainPagePhoto(image: UIImage(named: "photo_\(number)")!))
        }
        return photos + photos
    }
}
