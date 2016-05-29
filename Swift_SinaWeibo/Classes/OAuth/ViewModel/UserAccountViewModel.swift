//
//  UserAccountViewModel.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/22.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

class UserAccountViewModel: NSObject {
    
    let userInfoKey = "com.xiongcaichang.weibo.userAccount"
    
    var userAccount:UserAccount?
    
    
    static let shareUserAccountViewModel = UserAccountViewModel();
    
    
    override init() {
        
        super.init()
        
        
        userAccount=loadUserAccount()
        
    }
    
    
    var userLogin: Bool {
        
        //只读属性  用来判断  是否登录成功
        print(self.userAccount)
        if userAccount?.expires_date?.compare(NSDate()) == .OrderedDescending {
            return true
        }
        return false
    }
    
    
  
    
}




// MARK: - 网络请求

extension  UserAccountViewModel{
    
    
    
    func loadAccessToken(code:String,finishBlock:()->()) {
        
        
        
        CCNetWorkTool.shareTool.loadAccessToken(code) { (respondObject, error) in
            
            
            if error != nil {
                
                print("连接错误"+(error?.localizedDescription)!)
                return;
            }
            
            
            
            print(respondObject!)
            
            self.loadUserInfo(respondObject,finishBlock: finishBlock)
            
        }
        
   
        
        
        
        
    }
    
    
    
    func loadUserInfo(respondObject:AnyObject?,finishBlock:()->())  {
        
        let res = respondObject   as! [String:AnyObject]
        
        
        CCNetWorkTool.shareTool.loadUSerInfo(respondObject) { (respondObject, error) in
            
            if error != nil {
                
                print("连接错误"+(error?.localizedDescription)!)
                return;
            }
            
            var  userInfoDict = respondObject as! [String:AnyObject];
            
            for (key,value) in res{
                
                userInfoDict[key]=value;
                
            }
            
            self.saveUserAccount(userInfoDict,finishBlock: finishBlock)
            
            
            
        }
    }
    
    
    
}


// MARK: - 数据存储
extension UserAccountViewModel{
    func saveUserAccount(dict:[String:AnyObject],finishBlock:()->()) {
        
        let userDefault = NSUserDefaults.standardUserDefaults()
        let user = UserAccount(dict:dict)
        
        
        self.userAccount=user;
        let keys=["access_token","expires_in","uid","name","avatar_large"]
        
        let userInfo = user.dictionaryWithValuesForKeys(keys)
        

        userDefault.setObject(userInfo, forKey:self.userInfoKey)
        
        
        userDefault.synchronize()
        
        finishBlock();

        
        
    }
    
    
    func loadUserAccount() -> UserAccount? {
        
        guard let dict = NSUserDefaults.standardUserDefaults().objectForKey(userInfoKey) as! [String:AnyObject]?  else{
            
            return nil
            
        }
        
        let user = UserAccount(dict: dict)
        
        self.userAccount=user;
        
        print(user.access_token)
        
        return  user;
    }
}
