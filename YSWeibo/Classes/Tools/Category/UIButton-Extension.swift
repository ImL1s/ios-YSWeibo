//
//  UIButton-Extension.swift
//  YSWeibo
//
//  Created by ImL1s on 2017/7/15.
//  Copyright © 2017年 ImL1s. All rights reserved.
//

import UIKit

extension UIButton {
    
    convenience init(normal imageNormal: String, selected imageSelected: String, NormalBg imageNormalBg: String, normalBgSelected imageSelectedBg: String){
        self.init()
     
        self.setBackgroundImage(UIImage(named: imageNormal), for: .normal)
        self.setBackgroundImage(UIImage(named: imageSelected), for: .highlighted)
        self.setImage(UIImage(named: imageNormalBg), for: .normal)
        self.setImage(UIImage(named: imageSelectedBg), for: .highlighted)
        self.sizeToFit()
    }
}
