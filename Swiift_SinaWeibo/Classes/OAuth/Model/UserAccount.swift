//
//  UserAccount.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/22.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

class UserAccount: NSObject {

    var access_token:String?
    
    
   var expires_date :NSDate?;
    
    var expires_in:NSTimeInterval = 0{
        didSet{
            
            
            
            expires_date = NSDate(timeIntervalSinceNow: expires_in)
            
        }
    }
    
    

    
    
    var uid:String?
    
    var name:String?
    
    
    var avatar_large:String?
    
    
    
    
    init(dict:[String:AnyObject]) {
        
        super.init();
        setValuesForKeysWithDictionary(dict)
    
    }
    
    
    
    
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
        
    }
    
    
    
    
    

    
    
}
