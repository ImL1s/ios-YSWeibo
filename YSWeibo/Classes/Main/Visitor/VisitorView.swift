//
//  VisitorView.swift
//  YSWeibo
//
//  Created by ImL1s on 2017/7/16.
//  Copyright © 2017年 ImL1s. All rights reserved.
//

import UIKit

class VisitorView: UIView {

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var rotationView: UIImageView!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    
    
    func setUp(iconName: String, tip: String) {
        iconView.image = UIImage(named: iconName)
        tipLabel.text = tip
    }
    
    func lanchAnimation() {
        let rotation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.fromValue = 0
        rotation.toValue = Double.pi * 2
        rotation.repeatCount = MAXFLOAT
        rotation.duration = 10
        rotation.isRemovedOnCompletion = false
        rotationView.layer.add(rotation, forKey: nil)
    }
    
    class func visitorView() -> VisitorView{
        return Bundle.main.loadNibNamed("VistorView", owner: nil, options: nil)?.first as! VisitorView
    }
    
    

}

