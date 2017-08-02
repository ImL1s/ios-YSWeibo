//
//  NetworkManagerFactory.swift
//  YSWeibo
//
//  Created by ImL1s on 2017/8/1.
//  Copyright © 2017年 ImL1s. All rights reserved.
//

import UIKit

class NetworkManagerFactory: NSObject {

    static var instance: NetWorkManagerProtocol? = nil
    
    static func create() -> NetWorkManagerProtocol{
        if(instance == nil){
            instance = NetworkManager();
        }
        return instance!;
    }
}
