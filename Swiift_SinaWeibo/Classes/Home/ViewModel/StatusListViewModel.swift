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
    
    
    
    
    func loadHomeData(handlerBlock: (isSucess:Bool) -> () ) {
        CCNetWorkTool.shareTool.loadHomeData { (respondObject, error) in
            
            if  error != nil {
                
                handlerBlock(isSucess: false)
                
            }
            
            guard let dict =  respondObject as! [String:AnyObject]? else{
                
                return
            }
            
            guard let array = dict["statuses"] as! [[String:AnyObject]]? else{
                
                
                return
            }
            
            
            
            var tempArray = [StatusViewModel]();
            
            for  item in array {
                
                let status = Status(dict: item)
                
 
                let statusViewModel = StatusViewModel(status: status)
                tempArray.append(statusViewModel)
                
            
            }
            
            self.statusViewModelArray = self.statusViewModelArray + tempArray;
            
            
                handlerBlock(isSucess: true)

            
            
        }
        


    }
    
    
}
