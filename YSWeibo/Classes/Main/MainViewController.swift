//
//  MainViewController.swift
//  YSWeibo
//
//  Created by ImL1s on 2017/7/13.
//  Copyright © 2017年 ImL1s. All rights reserved.
//

import UIKit
import AFNetworking

class MainViewController: UITabBarController {
    
    let composeButton = UIButton(normal: "tabbar_compose_button",selected: "tabbar_compose_button_highlighted",NormalBg: "tabbar_compose_icon_add",normalBgSelected: "tabbar_compose_icon_add_highlighted")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTabBar()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initComposeButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func initComposeButton() {
        tabBar.addSubview(composeButton)
        composeButton.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.height * 0.5)
        composeButton.addTarget(self, action: #selector(composeBtnClick), for: .touchUpInside)
        
    }
    
    private func initTabBar(){
        let item = tabBar.items?[2]
        item?.isEnabled = false
    }
}

extension MainViewController{
    
    func composeBtnClick(){
        print("onClick")
    }
    
    // 使用 @objc 讓此方法加入到方法列表中
//    @objc private func composeBtnClick(){
//        print("onClick")
//    }
}
