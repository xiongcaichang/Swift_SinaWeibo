//
//  CCSearchBar.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/19.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

class CCSearchBar: UIView {
    
    @IBOutlet weak var searchTFtrail: NSLayoutConstraint!
    @IBOutlet weak var cancelButton: UIButton!

    @IBOutlet weak var searchTF: UITextField!

     class  func loadSearchBar( ) -> CCSearchBar {
        
        let searchBar = NSBundle.mainBundle().loadNibNamed("CCSearchBar", owner: nil, options: nil ).last as!CCSearchBar
    
        
        return searchBar
    }
    
    
    @IBAction func searchEditBegin(sender: AnyObject) {
        
        
        searchTFtrail.constant=cancelButton.frame.width
        
        UIView.animateWithDuration(0.25) { 
            self.layoutIfNeeded()
            
        }
        
        
        
    }
    
    @IBAction func searchEditEnd(sender: AnyObject) {
     searchTFtrail.constant=0
        UIView.animateWithDuration(0.25) {
            self.layoutIfNeeded()
            
        }
    }
    
    @IBAction func cancelBUttonClick() {
        self.endEditing(true)
    }
    
    
    override func awakeFromNib() {
        
        self.frame=CGRectMake(0, 0, SCREEN_WIDTH, 40)
        
        self.backgroundColor=UIColor.clearColor()
        
        searchTF.leftView=UIImageView(image: UIImage(named: "searchbar_textfield_search_icon"))
        
    
        //设置显示模式
        searchTF.leftViewMode = .Always
        //修改frame
        searchTF.leftView?.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        //设置视图的显示模式
        searchTF.leftView?.contentMode = .Center
        
        searchTF.layer.cornerRadius=20;
        searchTF.clipsToBounds=true
        searchTF.layer.borderWidth=2;
        searchTF.layer.borderColor=UIColor.orangeColor().CGColor
    
        
       
        
        
    }

}
