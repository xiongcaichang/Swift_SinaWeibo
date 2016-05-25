//
//  StatusPhotoView.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/24.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

class StatusPhotoView: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource{

    
    
    var pic_urls:[String]?{
        
        didSet{
            countLabel.text="\(pic_urls?.count)"
            
            
                        reloadData()
            
            self.snp_updateConstraints { (make) in
                
                make.size.equalTo(getSize())
            }
            

            
            
        }
    }
    
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.delegate=self;
        self.dataSource=self;
        
        self.backgroundColor = UIColor.whiteColor()
        
        
        registerClass(StatusPhotoCell.self, forCellWithReuseIdentifier: "statusPhotocell")
        
        
        
        setUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func getSize()->CGSize {
        
        
        let count = pic_urls?.count ?? 0
        
        
        let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing=1
        layout.minimumInteritemSpacing=1;
        
        var contentW = SCREEN_WIDTH-2*statusCellMargin
        
        var contentH = contentW
        


        
        
        
        var height:CGFloat?
         layout.itemSize = CGSizeMake(contentW/3-1, contentH/3-1)
        
        if count == 1 {
            layout.itemSize =  CGSizeMake(contentW/2, contentH/2)
            
            contentW = contentW/2
            
            height = contentH/2
            contentW = contentW/2
           
            
        }else if  count>1&&count <= 3{
            height = contentH/3
        }else if  count>3&&count <= 6{
            height = contentH/3*2
        }else if count == 0 {
            height = 0
        }else {
            
            height = contentH
            
        }

        
         return CGSize(width: SCREEN_WIDTH , height: height!)
        
    }
    
    
    func setUI() {
        

            

        
        
        
        /**
         *  测试数据
         */
            addSubview(countLabel)
        
            countLabel.snp_makeConstraints(closure: { (make) in
                
                make.center.equalTo(self.snp_center)
            })

        
    }
    
    
    
     var collectionView:UICollectionView?
    
    
     lazy var countLabel = UILabel(text: "", textColor: UIColor.whiteColor(), fontSize: 36)
    
}



extension StatusPhotoView{
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (pic_urls?.count) ?? 0
    }

    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView .dequeueReusableCellWithReuseIdentifier("statusPhotocell", forIndexPath: indexPath)   as!  StatusPhotoCell
        
        
        let picurl = NSURL(string: (pic_urls?[indexPath.item])!)
        
        cell.pic.sd_setImageWithURL(picurl)
        
        return cell
        
    }
    
    
}
