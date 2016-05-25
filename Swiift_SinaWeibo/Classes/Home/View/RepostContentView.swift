//
//  RepostContentView.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/24.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

class RepostContentView: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.grayColor()
        setUI()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setUI() {
        addSubview(contentLabel)
        
        addSubview(statusPhotoView)
        
        contentLabel.numberOfLines=0
        
        
        contentLabel.snp_makeConstraints { (make) in
            
            make.left.equalTo(self).offset(statusCellMargin)
            

            make.top.equalTo(self.snp_top).offset(statusCellMargin)
            

            
        }
        
        
        statusPhotoView.snp_makeConstraints { (make) in
            
        
            make.top.equalTo(contentLabel.snp_bottom).offset(statusCellMargin)
            
            //已经有了 size
            make.left.equalTo(self).offset(statusCellMargin)
    
            
            make.bottom.equalTo(self.snp_bottom).offset(-statusCellMargin)
            
        }
        
//        self.snp_makeConstraints { (make) in
//            
//            make.bottom.equalTo(statusPhotoView.snp_bottom).offset(statusCellMargin)
//        }
        
        
    
    }
    
    
     lazy var contentLabel = UILabel(text: "snxuasbciabbciabasbbcaybcauybcuabcuabcaubacubaucbyasbcuabxyaubcbcuaycbaysbcuyabuascbyuabcayubcuyabcub", textColor: UIColor.blackColor(), fontSize: 14,margin: statusCellMargin)
    

    
    

    lazy var statusPhotoView:StatusPhotoView = StatusPhotoView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())
    

}
