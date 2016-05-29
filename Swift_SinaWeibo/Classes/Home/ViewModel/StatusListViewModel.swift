//
//  StatusListViewModel.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/25.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

class StatusListViewModel: NSObject {

    
    lazy var statusViewModelArray:[StatusViewModel] = [StatusViewModel]()
    
    
    

    func loadHomeData(isPullup isPullup:Bool,handlerBlock: (isSucess:Bool) -> () ) {
        

        var  max_id:Int64 = 0
        var since_id:Int64 = 0
        
        
        if isPullup {
            
             max_id = statusViewModelArray.last?.status?.id ?? 0
            
        }else{
            
             since_id = statusViewModelArray.first?.status?.id ?? 0
        }
        
        
        
        
        
        CCNetWorkTool.shareTool.loadHomeData(since_id:since_id ?? 0, max_id: max_id ?? 0) { (respondObject, error) in
            
            
            if  error != nil {
                
                handlerBlock(isSucess: false)
                
            }
            
            guard let dict =  respondObject as! [String:AnyObject]? else{
                
                return
            }
            
            guard let array = dict["statuses"] as! [[String:AnyObject]]? else{
                
                
                return
            }
            
            
            
            var tempArray:[StatusViewModel] = [StatusViewModel]();
            
            for  item in array {
                
                let status = Status(dict: item)
                
                
                let statusViewModel = StatusViewModel(status: status)
                
                tempArray.append(statusViewModel)
                
                
            }
            
            if isPullup {
                self.statusViewModelArray = self.statusViewModelArray + tempArray;
                
            }else{
                self.statusViewModelArray =  tempArray + self.statusViewModelArray;
                
            }
            
     
            handlerBlock(isSucess: true)
            
            

            
        }


    }
    
    
}
