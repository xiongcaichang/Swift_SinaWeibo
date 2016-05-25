//
//  UIView+Inspectable.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/19.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

extension UIView{
    
    
    @IBInspectable var cornerRadius:CGFloat {
        get{
            return  self.layer.cornerRadius;
        }
        
        set{
            self.layer.cornerRadius=newValue;
        }
    }
    
    @IBInspectable var borderWidth:CGFloat {
        get{
            return  self.layer.borderWidth;
        }
        
        set{
            self.layer.borderWidth=newValue;
        }
    }
    
    
//    @IBInspectable var borderColor:CGColor {
//        
//        get{
//            return self.layer.borderColor!;
//        }
//        
//        
//        set{
//            self.layer.borderColor=newValue
//        }
//    }
//    
    
    
    
    
    
}



