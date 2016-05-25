//
//  WelcomeController.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/22.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit
import SDWebImage

class WelcomeController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUI()
        
        
        view.backgroundColor=UIColor.whiteColor()
        

        
        
        
        
        
    }
    
    
    
    func setUI() {
        
        iconView.layer.cornerRadius=45;
        iconView.clipsToBounds=true
    
                view.addSubview(imgBg)
        self.view.addSubview(iconView)
        self.view.addSubview(nameLabel)
        

        nameLabel.alpha=1;
        

        
        
        
        iconView.borderWidth=2;
        
        
        imgBg.snp_makeConstraints { (make) in
            
            make.left.top.bottom.right.equalTo(view);
        }

        
        
        iconView.snp_makeConstraints { (make) in
            
            
            make.size.equalTo(CGSizeMake(90, 90))
            
            make.bottom.equalTo(SCREEN_WIDTH-200)
            make.centerX.equalTo(view.snp_centerX)
            
            
        }
        
        nameLabel.snp_makeConstraints { (make) in
//            
//            make.centerX.equalTo(iconView.snp_centerX)
//            
//            make.centerY.equalTo(iconView.snp_centerY).offset(70);
        }
        
        
        
        UIView.animateWithDuration(0.5) { 
            
            self.iconView.snp_makeConstraints(closure: { (make) in
                
               
                
                
                
            })
            
        }
        
        
        
    }
    
    
    


    
    
    //界面已经出现的时候会自动调用
    //这个方法是页面显示之后的生命周期方法 在这个方法中所有的子视图的位置 已经设置完毕
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
//        startAnimation()
        
        
        CCAnimation()
    }
    
    
    
    func   CCAnimation() {
        
        
    
        
       UIGraphicsBeginImageContext(view.bounds.size)
        
        let path = UIBezierPath(arcCenter: view.center, radius: 100, startAngle: 0, endAngle: CGFloat(2*M_PI), clockwise: true)
        
        
        
        UIColor.orangeColor().setStroke()
        path.lineWidth=5
    
        path.stroke()
        
        
        let drawnImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.view.addSubview(UIImageView(image: drawnImage))
        
    
        
        
        
        view.bringSubviewToFront(iconView)
        
        
        
        
        nameLabel.snp_updateConstraints { (make) in
            
            make.center.equalTo(view.snp_center)
        }
        
        nameLabel.morphingDuration=2.5
        nameLabel.morphingEffect = .Sparkle
        let animation = CAKeyframeAnimation(keyPath: "position")
        
        animation.path=path.CGPath;
        
        animation.repeatCount=10;
        
        animation.duration=3
        
        
        
    
        
        iconView.layer.addAnimation(animation, forKey: nil)
        
        
        let time: NSTimeInterval = 0.0
        let delay = dispatch_time(DISPATCH_TIME_NOW,
                                  Int64(time * Double(NSEC_PER_SEC)))
        dispatch_after(delay, dispatch_get_main_queue()) {
            print("3 秒后输出")
            
            NSNotificationCenter.defaultCenter().postNotificationName(SWITCH_ROOT_VIEWCONTROLLER_NOTIFICATION, object: "")
            
            
        }
        
 
    
        
        
        
        
        
        
    }
    
    
    
    private func startAnimation() {
        
        let offsetY = -UIScreen.mainScreen().bounds.height + 180
        
        self.iconView.snp_updateConstraints { (make) -> Void in
            make.bottom.equalTo(self.view.snp_bottom).offset(offsetY)
            
            
        }
        

        
        
        
        //阻尼  弹簧系数  值越小效果越大     //加速度
        UIView.animateWithDuration(1.5, delay: 0, usingSpringWithDamping: 0.95, initialSpringVelocity: 9.8, options: [], animations: { () -> Void in
            
            
            self.view.layoutIfNeeded()
            
        }) { (_) -> Void in
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.nameLabel.alpha = 1
                }, completion: { (_) -> Void in
                    
                    
                    
                    NSNotificationCenter.defaultCenter().postNotificationName(SWITCH_ROOT_VIEWCONTROLLER_NOTIFICATION, object: "")
                    
                    
                    

                    
                    
            })
        }
    }
    
    
    
    lazy var imgBg:UIImageView = UIImageView(image: UIImage(named: "ad_bg"))

    
    private lazy var iconView:UIImageView = {
        
        let iconUrlString =  (UserAccountViewModel.shareUserAccountViewModel.userAccount?.avatar_large) ?? ""
        
        
        let imgV = UIImageView()
        
        
        imgV.sd_setImageWithURL(NSURL(string: iconUrlString)!, placeholderImage: UIImage(named: "avatar_default_big"))
        
           imgV.sd_setImageWithURL(NSURL(string: iconUrlString)!)
        
        print("-------       "+iconUrlString+"    ------>>>>>>"+(UserAccountViewModel.shareUserAccountViewModel.userAccount?.name ??   "没有读取到") )
        
        return imgV
    }()
    
    private lazy var nameLabel:LTMorphingLabel = {
        
        let label = LTMorphingLabel(text: UserAccountViewModel().userAccount?.name ?? "", textColor: UIColor.darkGrayColor(), fontSize: 24)
        
        
        return label;
        
        }()
        
        
        
        
//        UILabel()

}
