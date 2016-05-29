//
//  ComposeInfo.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/29.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

class ComposeInfo: NSObject {

    
    var title:String?
    
    var icon:String?
    
    
    var target:String?
    
    
    init(dict:[String:String]) {
        super.init();
        setValuesForKeysWithDictionary(dict)
    }
    
    
}
