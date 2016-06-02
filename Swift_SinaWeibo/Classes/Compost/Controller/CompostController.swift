//
//  CompostController.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/29.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

class CompostController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor=UIColor.whiteColor();
        
        setNav()
        
        setUI()

        setToolBar()
        
        
    }
    
    

    
    
    
    
    
    lazy var textV:UITextView = {
        
        let textV = UITextView()
        textV.font = UIFont.systemFontOfSize(16)

        return textV
    }()
    
    lazy var toolBar:UIToolbar = UIToolbar()
    

}





extension CompostController{
    
    
    func setNav() {
        self.navigationItem.leftBarButtonItem=UIBarButtonItem.createBarButtonItem("compose_photo_close", title: "", target: self, action: #selector(dismissSelf))
        
        self.navigationItem.rightBarButtonItem=UIBarButtonItem.createBarButtonItem(title: "发送", target:  self, action: #selector(dismissSelf))
    }
    
    @objc  private  func dismissSelf()  {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    func setUI() {
        
        view.addSubview(textV)
        textV.text="aschbahsbchjbajhcbhabschabshbjabchjasbjh"
        
        textV.snp_makeConstraints { (make) in
            
            make.left.right.top.equalTo(self.view)
            make.height.equalTo(200)
        }
        
        
    }
    
    

    
    
    
    
    func setToolBar() {
        view.addSubview(toolBar)
        
        //添加子视图
        view.addSubview(toolBar)
        //设置约束
        toolBar.snp_makeConstraints { (make) -> Void in
            make.left.right.bottom.equalTo(self.view)
            make.height.equalTo(44)
            //工具条默认的高度 44
        }
        var items = [UIBarButtonItem]()
        let itemSettings = [["imageName": "compose_toolbar_picture","actionName": "selectPicture"],
                            ["imageName": "compose_mentionbutton_background","actionName": "selectPicture"],
                            ["imageName": "compose_trendbutton_background","actionName": "selectPicture"],
                            ["imageName": "compose_emoticonbutton_background", "actionName": "selectEmoticon"],
                            ["imageName": "compose_add_background","actionName": "selectPicture"]]
        
        //添加 UIBarButtonItem到数组中
        for item in itemSettings {
            
            if let actionName = item["actionName"] {
                //                let barButtonItem = UIBarButtonItem(image:)
                let barButtonItem = UIBarButtonItem.createBarButtonItem(item["imageName"]!, target: self, action: Selector(actionName))
                
                items.append(barButtonItem)
            }
            
            //添加弹簧
            let space = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
            items.append(space)
            
        }
        //移除最后一个
        items.removeLast()
        toolBar.items = items
    }
    
    
    

    

    
}
