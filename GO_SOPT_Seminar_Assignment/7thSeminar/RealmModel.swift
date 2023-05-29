//
//  RealmModel.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/05/29.
//

import UIKit

import RealmSwift

final class RealmModel: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted var imageName: String
    @Persisted var title: String
    @Persisted var place: String
    @Persisted var time: String
    @Persisted var price: Int
    @Persisted var liked: Bool
    @Persisted var tradeStatus: String
    
    convenience init(imageName: String, title: String, place: String, time: String, price: Int, liked: Bool = false, tradeStatus: String) {
        self.init()
        
        self.imageName = imageName
        self.title = title
        self.place = place
        self.time = time
        self.price = price
        self.liked = liked
        self.tradeStatus = tradeStatus
    }
}



