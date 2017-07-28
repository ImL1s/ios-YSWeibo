//
//  UIHomePresentationController.swift
//  YSWeibo
//
//  Created by ImL1s on 2017/7/21.
//  Copyright © 2017年 ImL1s. All rights reserved.
//

import UIKit

class UIHomePresentationController: UIPresentationController {
    
    let converView = UIView()
    let width: CGFloat = 180
    let height: CGFloat = 250
    
    override func containerViewWillLayoutSubviews() {
        let x = (self.containerView!.frame.size.width * 0.5) - (width * 0.5);
        presentedView?.frame = CGRect(x: x, y: 60, width: width, height: height)
        
        converView.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
        converView.frame = (containerView?.bounds)!
        containerView?.addSubview(converView)
        
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(onConverViewClick))
        converView.addGestureRecognizer(tapGes)
    }
}

extension UIHomePresentationController{
    func onConverViewClick() {
        presentedViewController.dismiss(animated: true) { 
        }
    }
}
