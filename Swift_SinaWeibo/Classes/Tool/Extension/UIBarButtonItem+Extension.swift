//
//  UIBarButtonItem+Create.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/20.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit


extension UIBarButtonItem{
    
    
    
    class   func createBarButtonItem(iconName:String = "",title:String? = nil, target: AnyObject?, action: Selector) -> UIBarButtonItem {
        
        
        let button = UIButton(type: .Custom)
        
        button.setImage(UIImage(named: iconName), forState: .Normal)
        
        button .setTitle(title, forState: .Normal)
        
        
        
        button.setImage(UIImage(named: iconName+"_highlighted"), forState: .Highlighted)
        button.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        
        
        //设置图片的显示范围
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        //设置颜色
        button.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        button
            .setTitleColor(UIColor.orangeColor(), forState: .Highlighted)
        
        button.sizeToFit()
        return   UIBarButtonItem(customView: button);
        
    }
}
