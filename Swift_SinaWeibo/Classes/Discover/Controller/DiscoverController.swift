//
//  DiscoverController.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/19.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

class DiscoverController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavBar()
        
    }

    
    
    func  setNavBar(){
     self.navigationItem.titleView  =      CCSearchBar.loadSearchBar()
        
    }

    

}
