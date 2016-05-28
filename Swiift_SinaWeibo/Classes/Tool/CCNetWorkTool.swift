//
//  CCNetWorkTool.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/22.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit
import AFNetworking




struct API {
    let host = ""
    
    
    
}


enum HttpMethod {
    case GET
    case POST
}

class CCNetWorkTool: NSObject {
    
    
    
    let baseUrl:String?
    
    
    static let shareTool:CCNetWorkTool = {
        
        let tool = CCNetWorkTool(baseURL: nil)
        
        
        return tool;
        
    }()
    
    
    func requset(method:HttpMethod,urlStr:String,parameters:[String:AnyObject]?,finishedBlock:(respondObject:AnyObject?,error:NSError?) -> ()) {
        
    
        let manager = AFHTTPSessionManager();
        manager.responseSerializer.acceptableContentTypes?.insert("text/plain")
  
        
        if method == .POST {
            manager.POST(urlStr, parameters: parameters, progress: nil, success: { (task, respondObject) in
                
                
                finishedBlock(respondObject: respondObject, error: nil);
                
                }, failure: { (task, error) in
                    
                    finishedBlock(respondObject: nil, error: error)
                    
                    
            })
            
        }else if method == .GET{
            
            
            manager.GET(urlStr, parameters: parameters, progress: nil,  success: { (task, respondObject) in
                
                
                
                finishedBlock(respondObject: respondObject, error: nil);
                
                }, failure: { (task, error) in
                    
                    finishedBlock(respondObject: nil, error: error)
                    
                    
            })
            
        }
        
        
        
        
        
    }
    
     init(baseURL:String?) {
        
        baseUrl=baseURL;
        super.init();
    }

}




extension CCNetWorkTool{
    
    
    
    func loadAccessToken(code:String,finishedBlock:(respondObject:AnyObject?,error:NSError?) -> ()) {
        
            
            let urlString = "https://api.weibo.com/oauth2/access_token"
            
            let parmas = [
                "client_id":appKey,
                "client_secret":appSecret,
                "grant_type":"authorization_code",
                "code":code,
                "redirect_uri":redirect_uri
            ]
            
            
            CCNetWorkTool.shareTool.requset(.POST, urlStr: urlString, parameters: parmas) { (respondObject, error) in
                
                
                finishedBlock(respondObject: respondObject, error: error)
                
                
                
            
        }
        
        
    
    
    
    
    }
    
    
    
    func loadUSerInfo(respondObject:AnyObject?,finishedBlock:(respondObject:AnyObject?,error:NSError?) -> ()) {
        
        let res = respondObject   as! [String:AnyObject]
        
        
        let urlString = "https://api.weibo.com/2/users/show.json"
        
        let token = res["access_token"]
        
        let uid = res["uid"]
        
        let parmas = [
            "access_token":token!,
            "uid":uid!,
            
            ]
        
        CCNetWorkTool.shareTool.requset(.GET, urlStr: urlString, parameters:parmas) { (respondObject, error) in
            
            finishedBlock(respondObject: respondObject, error: error)
            
            
        }
        
    }
    
    
    
}


extension CCNetWorkTool{
        
        
        
        func loadHomeData(since_id since_id:Int64 = 0,max_id:Int64  = 0,finishedBlock:(respondObject:AnyObject?,error:NSError?) -> ()) {
            
            let token = UserAccountViewModel.shareUserAccountViewModel.userAccount?.access_token
            
            
            var parmas = [
                "access_token":token!
            ]
            
           
            if max_id > 0 {
                //max_id - 1解决数据重复的问题
                parmas["max_id"] = "\(max_id - 1)"
            }
            if since_id > 0 {
                parmas["since_id"] = "\(since_id)"
            }
            
            requset(.GET, urlStr: "https://api.weibo.com/2/statuses/home_timeline.json", parameters: parmas) { (respondObject, error) in
                
                print(error?.localizedDescription)
                finishedBlock(respondObject: respondObject, error: error)
            }
        }
    
    

        
        
}
