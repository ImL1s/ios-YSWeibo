//
//  MainViewController.swift
//  YSWeibo
//
//  Created by ImL1s on 2017/7/13.
//  Copyright © 2017年 ImL1s. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewController(HomeViewController(),title: "首頁",imageName: "tabbar_home")
        addChildViewController(MessageController(),title: "消息",imageName: "tabbar_message_center")
        addChildViewController(DiscoverViewController(),title: "發現",imageName: "tabbar_discover")
        addChildViewController(ProfileViewController(),title: "我",imageName: "tabbar_profile")

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func addChildViewController(_ childController: UIViewController, title: String, imageName: String) {
        
        childController.title = title
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        let childNav = UINavigationController(rootViewController: childController)
        addChildViewController(childNav)
    }
    
}
