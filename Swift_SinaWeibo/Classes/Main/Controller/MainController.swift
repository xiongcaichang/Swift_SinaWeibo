//
//  MainController.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/19.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

class MainController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        hidesBottomBarWhenPushed=true
        
        let mytabBar = CCTabBar()

        mytabBar.plusButton.addTarget(self, action: #selector(plusBtnClick), forControlEvents: .TouchUpInside)
        
        setValue(mytabBar, forKey: "tabBar" )
        
        
        
        setupChildItemsAndControllers();
    }


    

    
    
    
    private   func   setupChildItemsAndControllers(){
        
        addChildControllerAndItemWithPramas(HomeController(), title: "首页", iconName: "tabbar_home")
        addChildControllerAndItemWithPramas(MessageController(), title: "消息", iconName: "tabbar_message_center")
        addChildControllerAndItemWithPramas(DiscoverController(), title: "发现", iconName: "tabbar_discover")
        addChildControllerAndItemWithPramas(ProfileController(), title: "我的", iconName: "tabbar_profile")
    }
    
    
    func addChildControllerAndItemWithPramas(vC:UIViewController,title:String,iconName:String) -> () {
        
        
        let nav = CCNavgationController(rootViewController: vC)
        
        vC.title=title;
        vC.tabBarItem.image=UIImage(named: iconName)
        vC.tabBarItem.selectedImage=UIImage(named: iconName+"_selected")?.imageWithRenderingMode(.AlwaysOriginal)
        vC.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.orangeColor()], forState: .Selected)

        addChildViewController(nav)
        
    }
    


    
 
    //外部不可访问按钮的你点击事件
    //但是加了private  按钮不具备派发特性      为了系统可调用派发  则告诉系统使用objc实现的   @objc
    @objc  private func plusBtnClick()  {
        
        view.addSubview(CompostView());
        
        
        
    }
    

}
