//
//  User.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/23.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

class User: NSObject {
    
    
    var name:String?
    
     /// 用户头像地址   50*50
    var profile_image_url:String?
    
    
     /// 是否认证
    var verified:Int  = 0
    
     /// 用户等级
    var mbrank = 0;
    
    
    
    init(dict: [String : AnyObject]) {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
    }
    
    
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
        
    }
    
    
    
    

}
