//
//  StatusCell.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/23.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

class StatusCell: UITableViewCell {

    var bottomTopCons: Constraint?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    var statusViewModel:StatusViewModel?{
        didSet{
            
                        /// ----------original
            let headIconUrl = NSURL(string: (statusViewModel!.status?.user?.profile_image_url)!)
            
            statusOriginalView.headIcon.sd_setImageWithURL(headIconUrl)
            statusOriginalView.nameLabel.text=statusViewModel!.status?.user?.name;
            
            statusOriginalView.timelabel.text=statusViewModel!.status?.created_at;
            
            
            statusOriginalView.contentLabel.text=statusViewModel!.status?.text
            
            statusOriginalView.statusPhotoView.pic_urls = statusViewModel?.status?.pic_urls
            

            //卸载约束
            bottomTopCons?.uninstall()
            
            
            if statusViewModel?.status?.retweeted_status == nil {
                
                repostContentView.hidden=true
                
                statusBottom.snp_updateConstraints(closure: { (make) in
                    
                    self.bottomTopCons = make.top.equalTo(statusOriginalView.snp_bottom).offset(statusCellMargin).constraint
                    
                })
            }else{
                 repostContentView.hidden=false
                repostContentView.contentLabel.text="[转发]:   \((statusViewModel!.status?.retweeted_status?.text)!)"
                
                //转发微博图片不为空 那么则设置转发微博图片
                
                repostContentView.statusPhotoView.pic_urls=statusViewModel!.status?.retweeted_status?.pic_urls
            
                
                
                statusBottom.snp_updateConstraints(closure: { (make) in
                    
                   self.bottomTopCons = make.top.equalTo(repostContentView.snp_bottom).offset(statusCellMargin).constraint
                })
                
            }
            
            
            
            
            
            
            
         
            
                        /// ----------bottom
            statusBottom.attitudeButton.setTitle("\(statusViewModel!.status?.attitudes_count ?? 0)", forState: .Normal)
            
            statusBottom.repostButton.setTitle("\(statusViewModel!.status?.reposts_count ?? 0)", forState: .Normal)
            
            statusBottom.commmentButton.setTitle("\(statusViewModel!.status?.comments_count  ?? 0)", forState: .Normal)
            
            
            
            
            
        }
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let red:CGFloat =  227 / 255.0
        
        backgroundColor=UIColor(red: red, green: red, blue: red, alpha: 1)
        
        
        
        addView()
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    


    func addView() {
        contentView.addSubview(statusBottom)
        
        contentView.addSubview(repostContentView)
        contentView.addSubview(statusOriginalView)
        
        
        
        statusOriginalView.snp_makeConstraints { (make) in
            
            make.left.top.right.equalTo(contentView)
            
            
        }
        
        repostContentView.snp_makeConstraints { (make) in
            
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
            make.top.equalTo(statusOriginalView.snp_bottom)
            
        }
        
        statusBottom.snp_makeConstraints { (make) in
            
            make.height.equalTo(30);
             self.bottomTopCons = make.top.equalTo(repostContentView.snp_bottom).offset(statusCellMargin).constraint
            make.left.right.equalTo(contentView)

        }
        
        
        
        
        contentView.snp_makeConstraints { (make) -> Void in
            //其他的几个约束也需要同时添加 不然contentView只知道底部在哪个地方
            make.left.right.top.equalTo(self)
            make.bottom.equalTo(statusBottom.snp_bottom).offset(statusCellMargin)
        }
        
    }
    
    
    
    
    
    
    
    lazy  var  statusBottom:StatusBottom = StatusBottom();
    
    lazy  var statusOriginalView:StatusOriginalView = StatusOriginalView();
    

    
    lazy var repostContentView:RepostContentView = RepostContentView();
    
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        
        
    }

}
