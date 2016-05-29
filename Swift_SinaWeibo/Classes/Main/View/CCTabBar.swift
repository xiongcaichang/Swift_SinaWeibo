//
//  CCTabBar.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/19.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

class CCTabBar: UITabBar {
    
    
    

    override init(frame: CGRect) {
            
            super.init(frame: frame)
            
            addSubview(plusButton)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
    }

  
    
    override func layoutSubviews() {
        
        
        super.layoutSubviews()
        
        let w = self.bounds.width/5;
        let h = self.bounds.height;
        
        let rect = CGRectMake(0, 0, w, h);
        
        var index:CGFloat = 0
        
        
        //重写  tabbarItem的布局为   中间的加号留下布局空间
        for  subView in self.subviews{
            
            if subView.isKindOfClass(NSClassFromString("UITabBarButton")!)  {
                
                subView.frame=CGRectOffset(rect, w*index, 0);
                
                //当索引到了留空区域是则直接加上2
                index+=(index==1 ? 2 : 1)
                
            }
        
        }
        
        
        
        plusButton.frame=CGRectOffset(rect, w*2, 0)
        

    }
    
    
    
     lazy var plusButton:UIButton={
        
        
        let btn = UIButton(type: UIButtonType.Custom)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: .Normal)
        btn.setImage(UIImage(named:"tabbar_compose_icon_add_highlighted"), forState: .Selected)
        
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: .Normal)
        
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: .Selected)
        return btn;
    }()

}
