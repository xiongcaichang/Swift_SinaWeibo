//
//  Status.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/23.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

class Status: NSObject {
    
        /// 微博内容
    var text:String?
    
        /// 微博创建时间
    var created_at:String?
    
    
    
    
        /// id  如果为 Int 的时候会根据平台来适应长度   Int64 长整型
    var id:Int64 = 0
    
    
    var source:String?
    
    
    var user:User?
    
    var reposts_count:Int = 0
    var comments_count:Int = 0
    var attitudes_count:Int = 0
    
    
    
    var retweeted_status:Status?
    
    lazy var pic_urls:[String] = [String]()
    
    
    
    
    
    
    
    
    
    init(dict: [String : AnyObject]) {
        super.init()
        
        
        
        setValuesForKeysWithDictionary(dict)
    }
    
    
    
    override func setValue(value: AnyObject?, forKey key: String) {
        
        if key == "user" {
            
            let dict = value as! [String:AnyObject]
            
            user=User(dict: dict)
            
            return
            
        }
        
        
        if key == "retweeted_status" {
            let dict = value as!  [String:AnyObject]
            
            retweeted_status = Status(dict: dict)
            
            
            return;
        }
        
        
        if key == "pic_urls" {
            let dict = value as!  [[String:String]]
            for item in  dict{
                let urlStr:String = item["thumbnail_pic"]!
                
                
                pic_urls.append(urlStr)
            }
            
            return
        }
        
        super.setValue(value, forKey: key)
    }
    
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
        
    }
    

}
