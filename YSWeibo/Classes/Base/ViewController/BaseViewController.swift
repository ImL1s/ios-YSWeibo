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
