//
//  CustomUtils.swift
//  SailDemo
//
//  Created by qky on 15/1/20.
//  Copyright (c) 2015年 sail. All rights reserved.
//

import Foundation
class CustomUtils{
    class func shuffle<C: MutableCollectionType where C.Index == Int>(var list: C) -> C {
        let count = countElements(list)
        for i in 0..<(count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            swap(&list[i], &list[j])
        }
        return list
    }
}