//
//  UserAccountViewModel.swift
//  YSWeibo
//
//  Created by sam on 23/10/2017.
//  Copyright © 2017 ImL1s. All rights reserved.
//

import UIKit

class UserAccountViewModel {
    
    static let shareInstance: UserAccountViewModel = UserAccountViewModel()
    
    private var _account: UserAccount? = nil
    
    var account: UserAccount?{
        if(_account == nil){
            _account = NSKeyedUnarchiver.unarchiveObject(withFile: accountPath) as? UserAccount
        }
        return _account
    }
    
    var accountPath: String {
         var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        path.append("/account.plist")
        print(path)
        return path
    }

    var isLogin: Bool{
        if account == nil{
            return false
        }
        guard let expiresData = account?.expires_data else {
            return false
        }
        return expiresData.compare(Date()) == ComparisonResult.orderedDescending
    }
    
}
