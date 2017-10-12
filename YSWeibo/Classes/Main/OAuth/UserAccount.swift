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
    
    var expires_in: Int = 0
    
    var remind_in: Int = 0
    
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
        return dictionaryWithValues(forKeys: ["access_token","expires_in","uid","remind_in","isRealName"]).description
    }
}
