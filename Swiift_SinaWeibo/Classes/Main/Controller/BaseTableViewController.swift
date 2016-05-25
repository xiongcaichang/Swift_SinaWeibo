//
//  BaseViewController.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/20.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
    
    
    var LoginStatus = UserAccountViewModel().userAccount?.access_token != nil;
    
    
    lazy var visitorLoginView: VisitorLoginView = VisitorLoginView()
    
    override func loadView() {
        
        
        if LoginStatus {
            
            super.loadView();
            
        }else{
            loadMyView()
        }
        
        
        
    }
    
    
    
    func loadMyView()  {
        
        visitorLoginView.jum2LoginHanlder={(vc:UIViewController)   -> () in
            let nav = CCNavgationController(rootViewController: vc);
            
            
            self.presentViewController(nav, animated: true, completion: nil)
        }
        
        visitorLoginView.jum2RegistHanlder={(vc:UIViewController)   -> () in
            let nav = CCNavgationController(rootViewController: vc);

            
            self.presentViewController(nav, animated: true, completion: nil)
        
        }
        
        view = visitorLoginView
    }
    
    
    
    

    

}
