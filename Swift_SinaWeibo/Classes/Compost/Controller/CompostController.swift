//
//  CompostController.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/29.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

class CompostController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()

        
    }
    
    
    
    
    


}

extension CompostController{
    
    
    func setNav() {
        self.navigationItem.leftBarButtonItem=UIBarButtonItem.createBarButtonItem("navigationbar_pop", title: "", target: self, action: #selector(dismissSelf))
        
        self.navigationItem.rightBarButtonItem=UIBarButtonItem.createBarButtonItem(title: "发送", target:  self, action: #selector(dismissSelf))
    }
    
    @objc  private  func dismissSelf()  {
        
        self.dismissViewControllerAnimated(false, completion: nil)
    }
}