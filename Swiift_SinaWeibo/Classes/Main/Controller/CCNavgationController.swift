//
//  CCNavgationController.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/20.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

class CCNavgationController: UINavigationController ,UIGestureRecognizerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.translucent=false
        self.interactivePopGestureRecognizer?.delegate = self
        
    }
    
    
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        
        
        if childViewControllers.count>0 {
            
            viewController.hidesBottomBarWhenPushed=true
            
            let backBarItem = UIBarButtonItem.createBarButtonItem("navigationbar_back_withtext", title: "返回", target: self, action:#selector(popBack))
            
            backBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.blackColor()], forState: .Normal)
            
            
            viewController.navigationItem.leftBarButtonItem=backBarItem;
            
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    
    
    
    func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if childViewControllers.count>1 {
            return true;
        }
        return false;
    }
    
    
    func popBack() {
        popViewControllerAnimated(true)
    }
    
    
}
