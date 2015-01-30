//
//  AppTools.swift
//  SailDemo
//
//  Created by qky on 15/1/28.
//  Copyright (c) 2015年 sail. All rights reserved.
//

import Foundation
import UIKit


/**
App 工具类, 用于视图逻辑判断
*/
class AppTools{
    class func chooseRootViewController(){
       
    }
    
    
    /**
    保存账户信息
    */
    class AccountTool{
        class func setAccountInfo(accountInfo:AccountInfo){
            let userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.setObject(NSKeyedArchiver.archivedDataWithRootObject(accountInfo), forKey: "AccountInfo")
            userDefaults.synchronize()
        }
        class func getAccountInfo() -> AccountInfo?{
            let userDefaults = NSUserDefaults.standardUserDefaults()
            if let  data = userDefaults.dataForKey("AccountInfo"){
                return NSKeyedUnarchiver.unarchiveObjectWithData(data) as AccountInfo?
            }else{
                return nil
            }
            
        }
    }
}