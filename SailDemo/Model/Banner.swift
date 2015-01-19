//
//  Banner.swift
//  SailDemo
//
//  Created by qky on 14/11/16.
//  Copyright (c) 2014年 sail. All rights reserved.
//

import Foundation
class Banner{
    var title: String
    var imageUrl: String
    var id: Int
    init(id: Int, title: String, imageUrl: String){
        self.id = id
        self.title = title
        self.imageUrl = imageUrl
    }
}