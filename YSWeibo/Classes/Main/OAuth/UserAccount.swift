//
//  UserAccount.swift
//  YSWeibo
//
//  Created by ImL1s on 2017/10/11.
//  Copyright © 2017年 ImL1s. All rights reserved.
//

import UIKit

class UserAccount: NSObject,NSCoding {
    
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
    
    required init?(coder aDecoder: NSCoder){
        super.init()
        access_token = aDecoder.decodeObject(forKey: "access_token") as? String
        uid = aDecoder.decodeObject(forKey: "uid") as? String
        self.expires_in = aDecoder.decodeDouble(forKey: "expires_in") as TimeInterval
        self.remind_in = aDecoder.decodeInteger(forKey: "remind_in") as Int
        expires_data = Date(timeIntervalSinceNow: expires_in)
        isRealName = aDecoder.decodeObject(forKey: "isRealName") as? String
    }
    
    // 歸檔方法
    func encode(with aCoder: NSCoder) {
        aCoder.encode(access_token,forKey:"access_token")
        aCoder.encode(uid,forKey:"uid")
        //        aCoder.encode(expires_data,"expires_data")
        aCoder.encode(expires_in,forKey:"expires_in")
        aCoder.encode(remind_in,forKey:"remind_in")
        aCoder.encode(isRealName,forKey:"isRealName")
    }
    
    override var description: String{
        let propStr = dictionaryWithValues(forKeys: ["access_token","expires_in","uid","remind_in","isRealName","expires_data"]).description
        
        return "UserAccount: \(propStr)"
    }
}
