//
//  AppDelegate.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/19.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window=UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor=UIColor.whiteColor()
        window?.makeKeyAndVisible()
        
        
        if UserAccountViewModel.shareUserAccountViewModel.userLogin {
            
            window?.rootViewController=WelcomeController()
        }else{
            window?.rootViewController=MainController();
            
        }

        
        /**
         添加切换视图控制器的监听
         */
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(switchLoginStatusRootVC), name:SWITCH_ROOT_VIEWCONTROLLER_NOTIFICATION, object: nil)
        
        
        return true
        
    }
    
    
    
    
    /**
     切换根视图控制器的方法
     */
    func switchLoginStatusRootVC(note:NSNotification)  {
        
        
        
        if note.object == nil {
            window?.rootViewController=WelcomeController();
        }else{
            window?.rootViewController=MainController()
        }
        

        
        

    }

    func applicationWillResignActive(application: UIApplication) {
     
        
    }

    func applicationDidEnterBackground(application: UIApplication) {

        
    }

    func applicationWillEnterForeground(application: UIApplication) {

        
    }

    func applicationDidBecomeActive(application: UIApplication) {
        
    }

    func applicationWillTerminate(application: UIApplication) {
        
    }


}

