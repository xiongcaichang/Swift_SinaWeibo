//
//  UILabel+CC.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/22.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit



extension UILabel{
   
    
    convenience init(text:String,textColor:UIColor,fontSize:CGFloat,margin:CGFloat = 0) {
        
        self.init();
        
        self.text=text;
        
        self.textColor=textColor;
        
        self.font=UIFont.systemFontOfSize(fontSize)
        if margin > 0 {
            //设置 最大显示的宽度
            preferredMaxLayoutWidth = SCREEN_WIDTH - 2 * margin
            textAlignment = .Left
        }
        
        
        sizeToFit()

    }
    
    
}