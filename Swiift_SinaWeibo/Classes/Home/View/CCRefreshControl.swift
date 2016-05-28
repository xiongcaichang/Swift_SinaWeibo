//
//  CCRefreshControl.swift
//  Swiift_SinaWeibo
//
//  Created by bear on 16/5/28.
//  Copyright © 2016年 bear. All rights reserved.
//

import UIKit

//swift 中的枚举
enum HMRefreshStatue: Int {
    case Normal = 0    // 普通状态
    case Pulling = 1    //准备刷新状态
    case Refreshing = 2 //刷新状态
}

//刷新控件的高度
private let RefreshViewHeight: CGFloat = 60
class CCRefreshControl: UIControl {
    
    //刷新视图所在的状态
    //根据状态修改 UI界面
    //    var lastStatue: HMRefreshStatue = .Normal
    var statue: HMRefreshStatue = .Normal {
        didSet {
            //didSet 中 可以获取 newValue 和 oldValue
            switch statue {
            case .Normal:
                tipLabel.text = "下拉起飞"
                //停止转动小菊花
                indicatorView.stopAnimating()
                //显示箭头
                arrowicon.hidden = false
                //上一次的状态是 刷新状态  再减
                if oldValue == .Refreshing {
                    UIView.animateWithDuration(0.25, animations: { () -> Void in
                        var inset = self.scrollView!.contentInset
                        inset.top = inset.top - RefreshViewHeight
                        self.scrollView?.contentInset = inset
                    })
                    
                }
                
                
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    self.arrowicon.transform = CGAffineTransformIdentity
                })
            case .Pulling:
                tipLabel.text = "马上起飞"
                //旋转箭头
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    self.arrowicon.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
                })
            case .Refreshing:
                tipLabel.text = "正在飞ing...."
                //转动小菊花
                indicatorView.startAnimating()
                //隐藏箭头
                arrowicon.hidden = true
                //刷新数据 等待数据刷新成功之后  将状态改为 普通状态
                //主动给当前控件发送对应的事件类型 会自动找到对饮的target 调用监听的方法
                sendActionsForControlEvents(.ValueChanged)
                
                //修改contentInset.top
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    var inset = self.scrollView!.contentInset
                    inset.top = inset.top + RefreshViewHeight
                    self.scrollView?.contentInset = inset
                })
            }
            //            lastStatue = statue
        }
    }
    
    func endRefreshing() {
        
        let delta = dispatch_time(DISPATCH_TIME_NOW,Int64(Double(NSEC_PER_SEC) * 0.1))
        dispatch_after(delta, dispatch_get_main_queue()) { () -> Void in
            self.statue = .Normal
        }
        
    }
    
    override init(frame: CGRect) {
        //指定默认大小
        let rect = CGRect(x: 0, y: -RefreshViewHeight, width: SCREEN_WIDTH, height: RefreshViewHeight)
        super.init(frame: rect)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        //实时获取父视图的垂直方向位移  和 -124 比较 修改视图的状态
        // 需要有一个监测用户是否 '正在拖拽' 滚动视图
        let offsetY = scrollView!.contentOffset.y
        let targetOffsetY = -scrollView!.contentInset.top - RefreshViewHeight
        if scrollView!.dragging {
            if statue == .Pulling && offsetY > targetOffsetY {
                //只要满足 位移 大于 -124 并且 当前状态是 准备刷新刷新状态
                print("普通状态")
                statue = .Normal
            } else if  statue == .Normal && offsetY < targetOffsetY {
                print("准备刷新刷新状态")
                statue = .Pulling
            }
        } else {
            //没有拽动tableView && 当前状态是 准备刷新状态 才修改为 正在刷新状态
            if statue == .Pulling {
                print("正在刷新")
                statue = .Refreshing
                //转动小菊花
                indicatorView.startAnimating()
                //隐藏箭头
                arrowicon.hidden = true
            }
            
        }
        
        
    }
    
    //视图将要移动到父视图上的时候会自动调用
    override func willMoveToSuperview(newSuperview: UIView?) {
        super.willMoveToSuperview(newSuperview)
        //获取父视图
        if let myFather = newSuperview as? UIScrollView {
            //当前的刷新控件支持在滚动视图上添加
            //实时的获取滚动视图垂直方向的位移
            /*
             Observer: 要添加的观察着
             forKeyPath: 要观察的键值属性
             options:
             
             //作用:观察对象的属性变化
             */
            //          //KVO  KVC
            self.scrollView = myFather
            myFather.addObserver(self, forKeyPath: "contentOffset", options: [.New], context: nil)
        }
    }
    
    //MARK: 设置UI界面
    private func setupUI() {
//        backgroundColor = UIColor.yellowColor()
        
        addSubview(arrowicon)
        addSubview(tipLabel)
        addSubview(indicatorView)
        
        
        arrowicon.snp_makeConstraints { (make) -> Void in
            //水平居中 向左偏移 30
            make.centerX.equalTo(self.snp_centerX).offset(-30)
            make.centerY.equalTo(self.snp_centerY)
        }
        
        tipLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(arrowicon.snp_right)
            make.centerY.equalTo(self.snp_centerY)
        }
        
        
        indicatorView.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(arrowicon.snp_center)
        }
        
    }
    
    
    private var scrollView: UIScrollView?
    //懒加载子视图
    private lazy var arrowicon: UIImageView = UIImageView(image: UIImage(named: "tableview_pull_refresh"))
    private lazy var tipLabel: UILabel = UILabel(text: "下拉起飞", textColor: UIColor.darkGrayColor(), fontSize: 14)
    private lazy var indicatorView: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
    
    
    //移除对象的属性观察
    deinit {
        scrollView?.removeObserver(self, forKeyPath: "contentOffset")
    }
}
