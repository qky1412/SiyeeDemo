//
//  AccountInfo.swift
//  SailDemo
//
//  Created by qky on 15/1/29.
//  Copyright (c) 2015年 sail. All rights reserved.
//

import Foundation
class AccountInfo: NSObject, NSCoding{
    var name: String = ""
    var token: String = ""
    var id: String = ""
    var profile: String = ""


    override init() {
       
    }
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("name") as String
        token = aDecoder.decodeObjectForKey("token") as String
        id = aDecoder.decodeObjectForKey("id") as String
        profile = aDecoder.decodeObjectForKey("profile") as String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(token, forKey: "token")
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(profile, forKey: "profile")
    }

}