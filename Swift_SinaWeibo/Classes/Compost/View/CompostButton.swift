//
//  CompostButton.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/28.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

class CompostButton: UIButton {
    private let imageW: CGFloat = 80
    

    
    
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        return CGRect(x: 0, y: 0, width: imageW, height: imageW)
    }
    
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        return CGRect(x: 0, y: imageW, width: imageW, height: contentRect.size.height - imageW)
    }
    

}
