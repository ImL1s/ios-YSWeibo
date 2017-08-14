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
    
    let appkey: String = "2473814689"
    let redirectURl: String = "http://www.google.com.tw"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBar()
        loadPage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


extension OAuthViewController{
    func setUpNavigationBar() {
        navigationItem.leftBarButtonItem  = UIBarButtonItem(title: "關閉", style: .plain, target: self, action: #selector(onCloseItemClick))
    }
    
    func loadPage() {
        guard let url = URL(string: "https://api.weibo.com/oauth2/authorize?client_id=\(appkey)&redirect_uri=\(redirectURl)") else {
            return
        }
        webView.loadRequest(URLRequest(url: url))
        webView.delegate = self
        
    }
}


extension OAuthViewController{
    func onCloseItemClick() {
        dismiss(animated: true) {
            
        }
    }
}


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
        
        NSLog("code: %@", code!)
        
        dismiss(animated: true, completion: nil)
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
