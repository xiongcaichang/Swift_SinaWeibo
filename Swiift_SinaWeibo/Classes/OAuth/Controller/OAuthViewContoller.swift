//
//  OAuthViewContoller.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/22.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit
import SVProgressHUD

class OAuthViewContoller: UIViewController {

    
    

    lazy  var webView = UIWebView();

    override func loadView() {

        view=webView;
    }
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad();
        
        
        setNavBar()

        loadPage()
        
    }
    
    
    
    
    func loadPage() {
        
        let request = NSURLRequest(URL: NSURL(string: "https://api.weibo.com/oauth2/authorize?client_id="+appKey+"&redirect_uri="+redirect_uri)!)
        webView.delegate=self;
        webView.loadRequest(request)
    }
    
    
    

}




// MARK: - 导航相关
extension OAuthViewContoller{
    
    
    func setNavBar() {
        
        
        navigationItem.leftBarButtonItem=UIBarButtonItem.createBarButtonItem("", title: "关闭",target: self, action: #selector(closeSelf))
        
        navigationItem.rightBarButtonItem=UIBarButtonItem.createBarButtonItem("", title: "填充",target: self, action: #selector(fillAcount))
        
    }
    
    
    
    func fillAcount() {
        
        let javaScrip = "document.getElementById('userId').value='15223245@qq.com',document.getElementById('passwd').value='balabalabala';"
        
        webView.stringByEvaluatingJavaScriptFromString(javaScrip)
    }
    
    
    func closeSelf()  {
        
        dismissViewControllerAnimated(true, completion: nil);
    }
    
}


// MARK: - webView  代理
extension OAuthViewContoller: UIWebViewDelegate{
    
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        
        let urlString = request.URL?.absoluteString ?? "";
        
        
        let flag = "code="
        if urlString.containsString(flag) {
            
            
            let range = urlString.rangeOfString(flag)
            
            let subStr = urlString.substringFromIndex(range!.endIndex)
            
            
            UserAccountViewModel.shareUserAccountViewModel.loadAccessToken(subStr, finishBlock: { 
                
                NSNotificationCenter.defaultCenter().postNotificationName(SWITCH_ROOT_VIEWCONTROLLER_NOTIFICATION, object: nil)
            })
            
            
            
            SVProgressHUD.dismiss()
            
            return false;
            
            
            
        }
        
        
        
        return true
        
        
       
    }
    
    
    func webViewDidStartLoad(webView: UIWebView) {
        
        SVProgressHUD.show()
        
    }
    
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        SVProgressHUD.dismiss()
    }
    
    
      
}
