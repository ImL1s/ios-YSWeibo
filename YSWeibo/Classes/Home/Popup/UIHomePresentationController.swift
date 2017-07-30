//
//  UIHomePresentationController.swift
//  YSWeibo
//
//  Created by ImL1s on 2017/7/21.
//  Copyright © 2017年 ImL1s. All rights reserved.
//

import UIKit

class UIHomePresentationController: UIPresentationController {
    
    public var viewFrame: CGRect = CGRect.zero
    
    let converView = UIView()
    
    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = viewFrame
        
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
