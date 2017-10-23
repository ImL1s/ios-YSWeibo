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
    var isLogin = UserAccountViewModel.shareInstance.isLogin
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vistorView.loginBtn.addTarget(self, action: #selector(onLoginClick), for: .touchUpInside)
    }
    
    override func loadView() {
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
