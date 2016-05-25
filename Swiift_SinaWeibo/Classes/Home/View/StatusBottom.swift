//
//  StatusBottom.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/24.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

class StatusBottom: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor=UIColor.whiteColor()
        
        setUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setUI() {
        addSubview(repostButton)
        addSubview(commmentButton)
        addSubview(attitudeButton)
        

        
        
        repostButton.snp_makeConstraints { (make) in
           make.top.equalTo(self.snp_top)
//            make.bottom.equalTo(self.snp_bottom)
            make.width.height.equalTo(commmentButton)
            make.left.equalTo(self).offset(statusCellMargin)
            
        }
        
        
        
        commmentButton.snp_makeConstraints { (make) in
                       make.top.equalTo(self.snp_top)
//            make.bottom.equalTo(self.snp_bottom)
            make.left.equalTo(repostButton.snp_right)
            make.width.height.equalTo(attitudeButton)

        }
        
        
        
        attitudeButton.snp_makeConstraints { (make) in
                      make.top.equalTo(self.snp_top)
            
//            make.bottom.equalTo(self.snp_bottom)
            make.left.equalTo(commmentButton.snp_right)
            make.right.equalTo(self).offset(-statusCellMargin)
            
        }
        
        

        


        
        
        

    }
    
    
    

    
    lazy var commmentButton:UIButton={
        let btn=UIButton(type: UIButtonType.Custom)
        
        btn.setImage(UIImage(named: "timeline_icon_comment"), forState: .Normal)
        btn.setTitle("评论", forState: .Normal)
        
        btn.titleLabel?.font=UIFont.systemFontOfSize(14)
                btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        
        return btn
    }()
    
    lazy var  repostButton:UIButton={
        let btn=UIButton(type: UIButtonType.Custom)
        
        btn.setImage(UIImage(named: "timeline_icon_retweet"), forState: .Normal)
               btn.setTitle("转发", forState: .Normal)
                btn.titleLabel?.font=UIFont.systemFontOfSize(14)
        
        btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        return btn
    }()
    
    lazy var  attitudeButton:UIButton={
        let btn=UIButton(type: UIButtonType.Custom)
        
       
        btn.setImage( UIImage(named: "timeline_icon_like"), forState: .Normal)
               btn.setTitle("点赞", forState: .Normal)
                btn.titleLabel?.font=UIFont.systemFontOfSize(14)
                btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        return btn
    }()

}
