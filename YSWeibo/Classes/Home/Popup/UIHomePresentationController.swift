//
//  UIHomePresentationController.swift
//  YSWeibo
//
//  Created by ImL1s on 2017/7/21.
//  Copyright © 2017年 ImL1s. All rights reserved.
//

import UIKit

class UIHomePresentationController: UIPresentationController {
    
    let width: CGFloat = 180
    let height: CGFloat = 250
    
    override func containerViewWillLayoutSubviews() {
//        containerView?.frame = CGRect(x: 10, y: 10, width: 100, height: 200)
        let x = (self.containerView!.frame.size.width * 0.5) - (width * 0.5);
        presentedView?.frame = CGRect(x: x, y: 60, width: width, height: height)
        
    }
}
