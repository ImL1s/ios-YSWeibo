//
//  OAuthViewController.swift
//  YSWeibo
//
//  Created by ImL1s on 2017/8/7.
//  Copyright © 2017年 ImL1s. All rights reserved.
//

import UIKit
import SVProgressHUD

class OAuthViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        loadPage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


// MARK: other
extension OAuthViewController{
    func setUpNavigationBar() {
        navigationItem.leftBarButtonItem  = UIBarButtonItem(title: "關閉", style: .plain, target: self, action: #selector(onCloseItemClick))
        navigationItem.rightBarButtonItem  = UIBarButtonItem(title: "填充", style: .plain, target: self, action: #selector(onFillClick))
    }
    
    func loadPage() {
        guard let url = URL(string: "\(authorize_uri)client_id=\(app_key)&redirect_uri=\(redirect_url)") else {
            return
        }
        webView.loadRequest(URLRequest(url: url))
        webView.delegate = self
        
    }
    
    func loadAccessToken(accessCode: String) {
        NSLog("code: %@", accessCode)
        NetworkManager.shareInstance.loadAccessToken(code: accessCode) { (result, error) in
            if(error != nil){
                print(error!)
                return
            }
            let accessToken = result["access_token"]
            print(result)
            let account = UserAccount(dict: result)
            NSLog(accessToken as! String)
            print(account)
        }
        
        dismiss(animated: true, completion: nil)
    }
}


// MARK: event
extension OAuthViewController{
    func onCloseItemClick() {
        dismiss(animated: true) {
            
        }
    }
    
    func onFillClick(){
        let jsCode = "document.getElementById('userId').value='aa22396584@gmail.com';document.getElementById('passwd').value='aa8707887078';"
        webView.stringByEvaluatingJavaScript(from: jsCode)
    }
}


// MARK: UIWebViewDelegate
extension OAuthViewController: UIWebViewDelegate{
    
    public func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool{
        
        guard let url = request.url else {
            return true
        }
        
        let urlString = url.absoluteString
        
        guard urlString.contains("code=") else {
            return true
        }
        let code = urlString.components(separatedBy: "code=").last
        loadAccessToken(accessCode: code!)
        return false
    }
    

    public func webViewDidStartLoad(_ webView: UIWebView){
        SVProgressHUD.show()
    }
    

    public func webViewDidFinishLoad(_ webView: UIWebView){
        SVProgressHUD.dismiss()
    }
    

    public func webView(_ webView: UIWebView, didFailLoadWithError error: Error){
        SVProgressHUD.dismiss()
    }
}
