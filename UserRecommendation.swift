//
//  UserRecommendation.swift
//  SailDemo
//
//  Created by qky on 14/11/16.
//  Copyright (c) 2014年 sail. All rights reserved.
//

import Foundation
class UserRecommendation{
    var nickname: String
    var imageUrl: String
    var id: Int
    init(id: Int, nickname: String, imageUrl: String){
        self.id = id
        self.nickname = nickname
        self.imageUrl = imageUrl
    }
}