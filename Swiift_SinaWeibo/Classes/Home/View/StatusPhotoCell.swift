//
//  StatusPhotoCell.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/24.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

class StatusPhotoCell: UICollectionViewCell {
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(pic)
        pic.contentMode = .ScaleAspectFill
        pic.clipsToBounds = true
        
        pic.snp_makeConstraints { (make) in
            
            make.left.right.bottom.top.equalTo(contentView)
            
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var pic = UIImageView();
    
}
