//
//  UIButtonItem-Extension.swift
//  YSWeibo
//
//  Created by ImL1s on 2017/7/17.
//  Copyright © 2017年 ImL1s. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    convenience init(imageName: String) {
        self.init()
        
        let button = UIButton()
        button.setImage(UIImage(named: imageName), for: .normal)
        button.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        button.sizeToFit()
        
        self.customView = button
    }
}
