//
//  VisitorView.swift
//  YSWeibo
//
//  Created by ImL1s on 2017/7/16.
//  Copyright © 2017年 ImL1s. All rights reserved.
//

import UIKit

class VisitorView: UIView {

    class func visitorView() -> VisitorView{
        return Bundle.main.loadNibNamed("VistorView", owner: nil, options: nil)?.first as! VisitorView
    }
    

}
