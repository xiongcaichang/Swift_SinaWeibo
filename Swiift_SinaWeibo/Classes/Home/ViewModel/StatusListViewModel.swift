//
//  StatusListViewModel.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/25.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

class StatusListViewModel: NSObject {

    
    lazy var statusViewModel:[StatusViewModel] = [StatusViewModel]()
    
    
    
    
    func loadHomeData(handlerBlock: (isSucess:Bool) -> () ) {
        CCNetWorkTool.shareTool.loadHomeData { (respondObject, error) in
            
            if  error != nil {
                

                
            }
            
            
            guard let dict =  respondObject as! [String:AnyObject]? else{
                
                return
            }
            
            
            guard let array = dict["statuses"] as! [[String:AnyObject]]? else{
                
                
                return
            }
            
            
            
            
            for  item in array {
                
                let status = Status(dict: item)
                let statusViewModel = StatusViewModel(status: status)
                
                
                self.statusViewModel.append(statusViewModel)
                
                
                
                
            }
            
            
                handlerBlock(isSucess: true)

            
            
        }
        


    }
    
    
}
