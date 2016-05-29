//
//  StatusOriginalCell.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/23.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

class StatusOriginalView: UIView {
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.whiteColor()
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setUI() {
       addSubview(headIcon)
        addSubview(verifiedIcon)
        addSubview(nameLabel)
        addSubview(mbrankIcon)
        addSubview(timelabel)
        addSubview(sourceLabel)
        addSubview(contentLabel)
        addSubview(statusPhotoView)
        
        headIcon.cornerRadius=20
        contentLabel.numberOfLines=0
        
        
        
        
        headIcon.snp_makeConstraints { (make) in

            make.size.equalTo(CGSizeMake(40, 40))
            make.top.equalTo(self).offset(2*statusCellMargin)
            make.left.equalTo(self).offset(statusCellMargin)
        }
        
        
        verifiedIcon.snp_makeConstraints { (make) in
            
            make.size.equalTo(CGSizeMake(10, 10))
            make.bottom.right.equalTo(headIcon.snp_right)
        }
        
        
        nameLabel.snp_makeConstraints { (make) in
            
            make.left.equalTo(headIcon.snp_right).offset(statusCellMargin)
            make.top.equalTo(self).offset(2*statusCellMargin)
        }
        
        mbrankIcon.snp_makeConstraints { (make) in
            
            make.size.equalTo(CGSizeMake(10, 10))
            make.left.equalTo(nameLabel.snp_right).offset(statusCellMargin)
            make.bottom.equalTo(nameLabel);
            
        }
        timelabel.snp_makeConstraints { (make) in
            
            make.left.equalTo(headIcon.snp_right).offset(statusCellMargin)
            make.bottom.equalTo(headIcon.snp_bottom)
        }
        
        
        sourceLabel.snp_makeConstraints { (make) in
            
            make.top.equalTo(timelabel.snp_top)
            make.left.equalTo(timelabel.snp_right).offset(16)
        }
        
        
        contentLabel.snp_makeConstraints { (make) in
            
            make.left.equalTo(self).offset(statusCellMargin)
            make.top.equalTo(sourceLabel.snp_bottom).offset(statusCellMargin)
        }
        
        
        statusPhotoView.snp_makeConstraints { (make) in
        
            make.top.equalTo(contentLabel.snp_bottom).offset(statusCellMargin)
            make.left.equalTo(self).offset(statusCellMargin)

        }
        
        
//       make
//        取消了 contentView  的 frame 布局 改用  layout
        self.snp_makeConstraints { (make) in
            
            make.bottom.equalTo(statusPhotoView.snp_bottom).offset(statusCellMargin)
        }
        
        
    }
    
    
    
    lazy  var headIcon = UIImageView(image: UIImage(named: "avatar_default_big"))
    
    lazy var verifiedIcon = UIImageView(image: UIImage(named: "avatar_vip"))
    
    lazy var mbrankIcon = UIImageView(image: UIImage(named: "avatar_vip"))
    
    lazy var nameLabel = UILabel(text: "bear_access", textColor: UIColor.blackColor(), fontSize: 14)
    
    lazy var timelabel = UILabel(text: "2015", textColor: UIColor.orangeColor(), fontSize: 10)
    
    lazy var sourceLabel = UILabel(text: "来自 bear_Access", textColor: UIColor.blackColor(), fontSize: 10)
    
    lazy var contentLabel = UILabel(text: "201520152015201520152015201520152015", textColor: UIColor.blackColor(), fontSize: 14,margin: statusCellMargin)
    
    
    lazy var statusPhotoView:StatusPhotoView = StatusPhotoView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())
    
}
