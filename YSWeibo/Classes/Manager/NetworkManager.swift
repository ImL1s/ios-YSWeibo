//
//  NetworkManager.swift
//  YSWeibo
//
//  Created by ImL1s on 2017/8/1.
//  Copyright © 2017年 ImL1s. All rights reserved.
//

import Foundation
import AFNetworking

class NetworkManager: NetWorkManagerProtocol{
    
    public static let shareInstance: NetworkManager = NetworkManager()
    private let af: AFHTTPSessionManager = AFHTTPSessionManager.init()
    
    
    func request(requestType: RequestType, urlString: String, parameters: [String : AnyObject],
                 finished : @escaping (_ result : Any?, _ error : Error?) -> ()){
        
        let successCallback = {(task: URLSessionDataTask, result: Any?) -> Void in
            finished(result, nil)
        }
        
        let failureCallback = {(task: URLSessionDataTask?, error: Error?) -> Void in
            finished(nil, error)
        }
        
        if requestType == .GET{
            af.get(urlString, parameters: parameters, progress: nil, success: successCallback, failure: failureCallback)
        }else if(requestType == .POST){
            af.post(urlString, parameters: parameters, progress: nil, success: successCallback, failure: failureCallback)
        }
    }
}
