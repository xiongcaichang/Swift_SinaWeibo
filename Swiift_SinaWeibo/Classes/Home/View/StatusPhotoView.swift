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
        
        let contentW:CGFloat = SCREEN_WIDTH-2*statusCellMargin
        
        let contentH:CGFloat = contentW
        

        var collectionViewHeight:CGFloat?
        var collectionViewWidth:CGFloat?
        
        var row:Int = 0
    
        
        
        if count == 0 {
            collectionViewHeight = 0
            collectionViewWidth =  0
        }else if count==1 {
            
            collectionViewWidth = contentW/3.0*2
            collectionViewHeight = contentH/3.0*2
            
        }else if count>0&&count<=4 {
            row = (count-1)/2 + 1
            collectionViewWidth = contentW/3.0*2
            collectionViewHeight = contentH/3.0*CGFloat(row)
            
        }else if count > 4{
            row = (count-1)/3 + 1
            collectionViewWidth = contentW
            collectionViewHeight = contentH/3.0*CGFloat(row)
        }

        
        
        if count == 1 {
            layout.itemSize = CGSizeMake(collectionViewWidth!-1, collectionViewHeight!-1)
        }else{
            layout.itemSize = CGSizeMake(contentW/3.0-1, contentH/3.0-1)
        }
    
        
        
        


        
         return CGSize(width: collectionViewWidth! , height: collectionViewHeight!)
        
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
    
    
     lazy var countLabel = UILabel(text: "", textColor: UIColor.orangeColor(), fontSize: 36)
    
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
