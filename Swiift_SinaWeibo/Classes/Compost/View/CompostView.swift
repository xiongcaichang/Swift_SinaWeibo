//
//  CompostView.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/28.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

class CompostView: UIView {

    override init(frame: CGRect) {
        
        let rect = UIScreen.mainScreen().bounds
        super.init(frame: rect)
        
        self.backgroundColor = UIColor.whiteColor()
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setUI() {
        addSubview(bgView);
        bgView.frame = UIScreen.mainScreen().bounds
        
    }
    
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.removeFromSuperview()
    }
    
    
    
    lazy var bgView:UIImageView = UIImageView(image: UIImage.snapShotCurrentWindow().applyLightEffect())

}
