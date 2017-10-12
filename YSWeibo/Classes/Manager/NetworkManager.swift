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
    
    public static let shareInstance: NetworkManager = {
        let instance = NetworkManager()
//        instance.af.responseSerializer = AFJSONRequestSerializer.init(writingOptions: JSONSerialization(.allowFragments))
//                instance.af.responseSerializer = AFJSONRequestSerializer.init(writingOptions: JSONReadingAllowFragments)
//        instance.af.requestSerializer = AFHTTPRequestSerializer()
//        instance.af.requestSerializer = AFHTTPRequestSerializer()
//        instance.af.requestSerializer = AFJSONRequestSerializer()
//        instance.af.responseSerializer = AFHTTPResponseSerializer()
//        instance.af.responseSerializer = AFJSONResponseSerializer()
        instance.af.responseSerializer.acceptableContentTypes?.insert("text/plain")
        instance.af.responseSerializer.acceptableContentTypes?.insert("text/html")
//        instance.af.responseSerializer.acceptableContentTypes?.insert("text/json")
        instance.af.responseSerializer.acceptableContentTypes?.insert("application/json;charset=UTF-8")
        instance.af.responseSerializer.acceptableContentTypes?.insert("application/json")
        return instance
    }()
    
    private let af: AFHTTPSessionManager = AFHTTPSessionManager.init()
    
    typealias Finished = (_ result: [String: Any], _ error: Error?) ->()
    
    
    func request(requestType: RequestType, urlString: String, parameters: [String : Any],
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

extension NetworkManager{
    
    func loadAccessToken(code: String, finished: @escaping Finished) {
        let parameters = ["client_id" : app_key, "client_secret" : app_secret, "grant_type" : "authorization_code", "code" : code, "redirect_uri" : redirect_url]
        request(requestType: .POST, urlString: access_token_uri, parameters: parameters) { (result: Any?, error: Error?) -> () in
            if(error != nil){
                print(error!)
                return
            }
            let jsonObject = result as! [String:Any]
            finished(jsonObject, error)
            
        }
    }
    
    func loadUserInfo(accessToken: String, uid: String, finished: @escaping Finished) {
        let parameters = ["access_token" : accessToken, "uid" : uid]
        request(requestType: .GET, urlString: user_info_uri, parameters: parameters) { (result, error) in
            if(error != nil){
                print(error!)
                return
            }
            let jsonObject = result as! [String:Any]
            finished(jsonObject,error)
        }
    }
}
