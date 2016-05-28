//
//  UIImage+Extension.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/28.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

extension UIImage {
    
    class func snapShotCurrentWindow() -> UIImage{
        
        let  window = UIApplication.sharedApplication().keyWindow!
        
        
        UIGraphicsBeginImageContextWithOptions(window.bounds.size, false, UIScreen.mainScreen().scale)
        
        window.drawViewHierarchyInRect(window.bounds, afterScreenUpdates: false)
        
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        
        UIGraphicsEndImageContext()
        
        
        return image;
        
    }

}
