//
//  StatusCell.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/23.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

class StatusCell: UITableViewCell {

    
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
            
            print(statusViewModel?.status?.pic_urls)
            
            
            repostContentView.contentLabel.text=statusViewModel!.status?.retweeted_status?.text
            
            //转发微博图片不为空 那么则设置转发微博图片
            
            repostContentView.statusPhotoView.pic_urls=statusViewModel!.status?.retweeted_status?.pic_urls
            

            
            
            if statusViewModel?.status?.retweeted_status == nil {
                
                statusBottom.snp_updateConstraints(closure: { (make) in
                    
                    make.top.equalTo(statusOriginalView.snp_bottom).offset(statusCellMargin)
                })
            }else{
                statusBottom.snp_updateConstraints(closure: { (make) in
                    
                    make.top.equalTo(repostContentView.snp_bottom).offset(statusCellMargin)
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
        
        
        
        addOriginalView()
        
        addRepostContentView()
        
        addBottonView()
        
        
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    func addOriginalView() {
        
        contentView.addSubview(statusOriginalView)
        
        
        
        statusOriginalView.snp_makeConstraints { (make) in
            
            make.left.top.right.equalTo(contentView)
            
            
            
        }
        
    }
    
    func addRepostContentView() {
        contentView.addSubview(repostContentView)
        
        repostContentView.snp_makeConstraints { (make) in
            
            make.left.equalTo(contentView)
//            make.right.equalTo(contentView)
            make.top.equalTo(statusOriginalView.snp_bottom)
    
        }
        
    }
    


    func addBottonView() {
        contentView.addSubview(statusBottom)
        
        statusBottom.snp_makeConstraints { (make) in
            
            make.height.equalTo(30);
            make.top.equalTo(repostContentView.snp_bottom).offset(statusCellMargin)
            make.left.right.equalTo(contentView)
            make.bottom.equalTo(contentView).offset(-15)

        }
        
    }
    
    
    
    
    
    lazy  var  statusBottom:StatusBottom = StatusBottom();
    
    lazy  var statusOriginalView:StatusOriginalView = StatusOriginalView();
    

    
    lazy var repostContentView:RepostContentView = RepostContentView();
    
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        
        
    }

}
