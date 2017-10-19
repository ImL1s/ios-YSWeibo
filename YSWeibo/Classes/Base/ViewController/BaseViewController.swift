//
//  BaseViewController.swift
//  YSWeibo
//
//  Created by ImL1s on 2017/7/16.
//  Copyright © 2017年 ImL1s. All rights reserved.
//

import UIKit

class BaseViewController: UITableViewController {
    
    lazy var vistorView = VisitorView.visitorView()
    var isLogin = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vistorView.loginBtn.addTarget(self, action: #selector(onLoginClick), for: .touchUpInside)
    }
    
    override func loadView() {
        var accountPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        accountPath.append("/account.plist")
        let account = NSKeyedUnarchiver.unarchiveObject(withFile: accountPath) as? UserAccount
        
        if account == nil{
            print("account unarchive failed or account not exist")
        }else{
            if let accessToken = account!.access_token{
                if let expiresDate = account?.expires_data{
                    isLogin = (expiresDate.compare(Date()) == ComparisonResult.orderedDescending)
                }
                isLogin = true
                
            }else{
                print("account token not exist")
            }
        }
        
        
        
        isLogin ? super.loadView() : loadVistorView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension BaseViewController{
    
    func loadVistorView() {
        self.view = vistorView
    }
}

extension BaseViewController{
    
    func onLoginClick() {
        present(UINavigationController(rootViewController: OAuthViewController()), animated: true) { 
            
        }
    }
}
