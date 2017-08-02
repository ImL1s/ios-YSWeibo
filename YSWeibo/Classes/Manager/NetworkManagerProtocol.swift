//
//  NetworkManagerProtocol.swift
//  YSWeibo
//
//  Created by ImL1s on 2017/8/1.
//  Copyright © 2017年 ImL1s. All rights reserved.
//

import Foundation

enum RequestType: String{
    case GET = "GET"
    case POST = "POST"
}

protocol NetWorkManagerProtocol{
    
    func request(requestType: RequestType, urlString: String, parameters: [String : AnyObject],
                 finished : @escaping (_ result : Any?, _ error : Error?) -> ())
}

