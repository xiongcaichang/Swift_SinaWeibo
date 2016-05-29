//
//  ComposeView.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/28.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

class ComposeView: UIView {
    
    
    var composeButtonClickHandler:((targetVC:UIViewController) -> ())?
    
    
    init(frame: CGRect,composeButtonClickHandler:(targetVC:UIViewController) -> ()) {
    
        let rect = UIScreen.mainScreen().bounds
        super.init(frame: rect)
        

    
    
    
    self.composeButtonClickHandler = composeButtonClickHandler;
    
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setUI() {
        addSubview(bgView);
        bgView.frame = UIScreen.mainScreen().bounds
        
        
        
        addChildButtons()
        
        
        
    }
    
    
    
    
    //添加6个按钮
    private func addChildButtons() {
        let count = composeInfos.count
        let bW: CGFloat = 80
        let bH: CGFloat = 110
        let margin: CGFloat = (SCREEN_WIDTH - 3 * bW) / 4
        let rect = CGRect(x: 0, y: 0, width: bW, height: bH)
        for i in 0..<count {
            
            let item = composeInfos[i]
            let button = ComposeButton()
            button.addTarget(self, action: #selector(ComposeView.buttonDidClick(_:)), forControlEvents: .TouchUpInside)
            button.composeItem = item
            button.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
            button.titleLabel?.textAlignment = .Center

            
            //修改按钮的frame
            //获取行 和 列
            let row = i / 3
            let col = i % 3
            
            
            
            
            let offsetX = (bW + margin) * CGFloat(col) + margin
            let offsetY = (bH + margin) * CGFloat(row) + SCREEN_HEIGHT
            button.frame = CGRectOffset(rect, offsetX, offsetY)
            print(button.frame)
        
             addSubview(button)
            //添加到数组中
            buttonArray.append(button)
        }
    }

    

    
    
    @objc private func buttonDidClick(compostButton:ComposeButton) {
        
        
        
    
        for btn in buttonArray {
            var scale: CGFloat = 0
            if compostButton == btn {
                //就是被点击的按钮
                scale = 2.0
            } else {
                scale = 0.1
            }
            //执行动画东效果
            UIView.animateWithDuration(0.25, animations: { () -> Void in
                //设置alpha
                btn.alpha = 0
                btn.transform  = CGAffineTransformMakeScale(scale, scale)
                }, completion: { (_) -> Void in
                    print("OK")
                    
                   
            })
        }
        
        
        
        guard let className = compostButton.composeItem?.target else {
            print("className 为空")
            return
        }
        //需要记忆
        //根据字符串获取对应的类型
        let classType = NSClassFromString(className) as! UIViewController.Type
        let vc = classType.init()
        let nav = UINavigationController(rootViewController: vc)
        
        
        
        
        
            
        self.composeButtonClickHandler?(targetVC:nav)
            
        
        //防止动画  显示 bug  需要在   present之后再移除
        let time: NSTimeInterval = 0.5
        let delay = dispatch_time(DISPATCH_TIME_NOW,
                                  Int64(time * Double(NSEC_PER_SEC)))
        dispatch_after(delay, dispatch_get_main_queue()) {
            self.removeFromSuperview()
        }
        

        
        

        
        
    }
    
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        //执行动画  依次获取每个按钮 给按钮执行动画
        for (index,button) in buttonArray.reverse().enumerate() {
            animationWith(button, index: index)
        }
    }
    
    
    override func willMoveToSuperview(newSuperview: UIView?) {
        super.willMoveToSuperview(newSuperview)
        
        //执行动画  依次获取每个按钮 给按钮执行动画
        for (index,button) in buttonArray.enumerate() {
            animationWith(button, index: index, isUp: true)
        }
    }
    
    private func animationWith(button: ComposeButton, index: Int, isUp: Bool = false) {
        UIView.animateWithDuration(0.8, delay: Double(index) * 0.03, usingSpringWithDamping: 0.6, initialSpringVelocity: 5, options: [], animations: { () -> Void in
            //修改按钮的中心点
            button.center = CGPoint(x: button.center.x, y: button.center.y + (isUp ? -350 : 350))
            }, completion: { (_) -> Void in
                if !isUp {
                    //向下的效果
                    self.removeFromSuperview()
                }
        })
    }
    
    lazy var buttonArray:[ComposeButton] = [ComposeButton]()
    
    lazy var bgView:UIImageView = UIImageView(image: UIImage.snapShotCurrentWindow().applyLightEffect())
    
    
    private lazy var composeInfos:[ComposeInfo] = {
        //从文件中读取数组
        
        let path = NSBundle.mainBundle().pathForResource("Compose.plist", ofType: nil)!
        let array = NSArray(contentsOfFile: path) as! [[String : String]]
        //遍历数组  字典转模型
        var itemArray = [ComposeInfo]()
        for item in array {
            let composeItem = ComposeInfo(dict: item)
            itemArray.append(composeItem)
        }
        
        return itemArray
    }()
}
