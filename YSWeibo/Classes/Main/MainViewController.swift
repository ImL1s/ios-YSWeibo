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
        
        // get json file path
        guard let jsonPath = Bundle.main.path(forResource: "MainVCSettings.json", ofType: nil) else{
            print("json path not found")
            return
        }
        
        // path to binary
        guard let jsonData = NSData(contentsOfFile: jsonPath) else {
            print("json load failed")
            return
        }
        
        // binary data(JSON) to mutable dic
        guard let anyObject = try? JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers)
            else{
                return
        }
        
        // any obj to dic
        guard let dic = anyObject as? [[String : AnyObject]] else {
            print("convert to dic failed")
            return
        }
        
        for item in dic{
            guard let vcName = item["vcName"] as? String else {
                print("vmName not found")
                continue
            }
            
            guard let title = item["title"] as? String else {
                print("title not found")
                continue
            }
            
            guard let imageName = item["imageName"] as? String else {
                print("imageName not found")
                continue
            }
            
            addChildViewController(vcName,title: title,imageName: imageName)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // 創建控制器並且賦予相對的title和icon
    private func addChildViewController(_ childController: UIViewController, title: String, imageName: String) {
        
        childController.title = title
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        let childNav = UINavigationController(rootViewController: childController)
        addChildViewController(childNav)
    }
    
    // 使用字串創建控制器並且賦予相對的title和icon
    private func addChildViewController(_ childController: String, title: String, imageName: String) {
        
        guard let namespace = Bundle.main.infoDictionary?["CFBundleExecutable"] as? String else {
            return
        }
        
        guard let anyClass = NSClassFromString(namespace + "." + childController) else {
            return
        }
        
        guard let vcClass = anyClass as? UIViewController.Type else {
            return
        }
        
        let vc =  vcClass.init()
        addChildViewController(vc, title: title, imageName: imageName)
        
    }
    
}
