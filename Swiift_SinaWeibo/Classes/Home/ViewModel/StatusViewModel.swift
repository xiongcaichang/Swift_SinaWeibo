//
//  StatusCellViewModel.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/25.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit


 /// 讲不能直接显示的数据进行处理

class StatusViewModel: NSObject {
    
      var status:Status?
    
    
    
    
     init(status:Status) {
        super.init()
        
        self.status=status
        
    }
    
    

}
