//
//  UserAccount.swift
//  YSWeibo
//
//  Created by ImL1s on 2017/10/11.
//  Copyright © 2017年 ImL1s. All rights reserved.
//

import UIKit

class UserAccount: NSObject {
    
    var access_token: String?
    
    var expires_in: TimeInterval = 0.0{
        didSet{
            expires_data = Date(timeIntervalSinceNow: expires_in)
        }
    }
    
    var remind_in: Int = 0
    
    var expires_data : Date?
    
    var uid: String?
    
    var isRealName: String?
    
    override init() {
        super.init()
    }
    
    init(dict: [String:Any]){
        super.init()
        setValuesForKeys(dict)
    }
    
    override var description: String{
        let propStr = dictionaryWithValues(forKeys: ["access_token","expires_in","uid","remind_in","isRealName","expires_data"]).description
        
        return "UserAccount: \(propStr)"
    }
}
