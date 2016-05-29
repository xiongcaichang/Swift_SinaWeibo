//
//  VisitorLoginView.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/20.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

class VisitorLoginView: UIView {
    
    
    
    var  jum2LoginHanlder:((vc:UIViewController)->() )?
    
    var  jum2RegistHanlder:((vc:UIViewController)->() )?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor=UIColor(red: 237/255.0, green: 237/255.0, blue: 237/255.0, alpha: 1)
        setUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUI()  {
        
        
        addSubview(circleIcon)
        
        addSubview(largeHouse)
        
        bringSubviewToFront(largeHouse)
        
        addSubview(tipLabel)
        
        addSubview(loginBtn)
        
        addSubview(registerBtn)
        addSubview(maskIcon)
        
        
        circleIcon.snp_makeConstraints { (make) in
            
            make.size.equalTo(CGSizeMake(160, 160))
            make.centerX.equalTo(self.snp_centerX);
            
            make.centerY.equalTo(self.snp_centerY).offset(-80)
            
        }
        
        largeHouse.snp_makeConstraints { (make) in
            
            make.center.equalTo(circleIcon)
        }
        
        tipLabel.snp_makeConstraints { (make) in
    
            make.centerX.equalTo(self.snp_centerX);
            
            make.centerY.equalTo(self.snp_centerY).offset(16)
        }
        
    
        loginBtn.snp_makeConstraints { (make) in
            
            make.size.equalTo(CGSizeMake(100, 40))
            make.centerX.equalTo(self.snp_centerX).offset(-80)
            make.top.equalTo(tipLabel.snp_bottom).offset(16)
            
            
        }
        
        
        
        registerBtn.snp_makeConstraints { (make) in
             make.size.equalTo(CGSizeMake(100, 40))
            make.centerX.equalTo(self.snp_centerX).offset(80)
            make.top.equalTo(tipLabel.snp_bottom).offset(16)
            
            
            
        }
        
        maskIcon.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(180, 180))
           make.center.equalTo(circleIcon)
        }
        
        
        
        loginBtn.addTarget(self, action: #selector(userWillLogin), forControlEvents: .TouchUpInside)
        registerBtn.addTarget(self, action: #selector(userWillRegist), forControlEvents: .TouchUpInside)
        
        
        
    }
    
    
    
    @objc  private  func userWillLogin() {
        
        jum2LoginHanlder!(vc: OAuthViewContoller())
    }
    
    
    @objc  private func userWillRegist() {
        
        jum2RegistHanlder!(vc:OAuthViewContoller())
        
        
    }
    
    
    
    
   private lazy var maskIcon: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
    
    
    //懒加载子视图
    //圈圈
    private lazy var circleIcon: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    //大房子
    private lazy var largeHouse: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    
    //提示登录注册的 '文案'
    private lazy var tipLabel: UILabel = {
        let l = UILabel()
        
        l.text = "关注一些人,回到这里看看有什么惊喜"
        //字号 和颜色
        l.textColor = UIColor.darkGrayColor()
        l.font = UIFont.systemFontOfSize(14)
        l.textAlignment = .Center
        //自适应大小
        l.sizeToFit()
        return l
    }()
    
    //登录注册按钮
    private lazy var loginBtn: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("登录", forState: .Normal)
        btn.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        //设置文字大小
        btn.titleLabel?.font = UIFont.systemFontOfSize(15)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: .Normal)
        
        return btn
    }()
    
    
    private lazy var registerBtn: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("注册", forState: .Normal)
        btn.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        //设置文字大小
        btn.titleLabel?.font = UIFont.systemFontOfSize(15)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: .Normal)
        
        return btn
    }()
    
    
    
    
    //MARK: 通过外界调用设置访客视图的页面信息
    func updateUI(title: String, imageName: String,isHome: Bool = false) {
        if  isHome {
            //是首页  做动画
            startAnimation()
        } else {
            //不是首页
            largeHouse.hidden = true
            //将圈圈一道最顶层
            bringSubviewToFront(circleIcon)
        }
        circleIcon.image = UIImage(named: imageName)
        tipLabel.text = title
    }
    
    
    
    func startAnimation()  {
        
        let baseAnimation = CABasicAnimation(keyPath: "transform.rotation")
        
        baseAnimation.repeatCount = MAXFLOAT
        baseAnimation.duration=15
        baseAnimation.toValue = 2*M_PI
        
        baseAnimation.removedOnCompletion=false;
        
        circleIcon.layer.addAnimation(baseAnimation, forKey: nil)
        
        
    }
    

}
