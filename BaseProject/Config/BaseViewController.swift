//
//  Macro.swift
//  WindWardBaseProject
//
//  Created by choice on 16/5/19.
//  Copyright © 2016年 choice. All rights reserved.
//

import UIKit

public class BaseViewController: UIViewController {
    
    private var coverView: UIView!      //无列表の覆盖view
    private var coverLabel: UILabel!
    
    public var isHiddenCoverView: Bool = true {
        didSet {
            if isHiddenCoverView == true {
                coverView.isHidden = true
            } else {
                coverView.isHidden = false
            }
        }
    }
    
    //Mark: - 自定义title  必须放在 leftBarButtonItem和rightBarButtonItem初始化之后调用
    var customTitle = ""{
        didSet{
            let titleView                 = UIView.init(frame: CGRect.init(x: 0, y: 0, width: ScreenWidth, height: 44))
            titleView.autoresizingMask    = [UIViewAutoresizing.flexibleWidth,
                                             UIViewAutoresizing.flexibleLeftMargin,
                                             UIViewAutoresizing.flexibleRightMargin]
            titleView.autoresizesSubviews = true
            titleView.backgroundColor     = UIColor.clear
            let labTitle                  = UILabel.init(frame: CGRect(x: 0, y: 0, width: titleView.frame.size.width, height: titleView.frame.size.height))
            labTitle.backgroundColor      = UIColor.clear
            labTitle.textAlignment        = NSTextAlignment.center
            labTitle.lineBreakMode        = NSLineBreakMode.byClipping
            labTitle.textColor            = NavTitleColor
            
            if (Double(UIDevice.current.systemVersion) ?? 0.0) >= 9.0 {
                labTitle.font           = UIFont.init(name: "PingFang SC", size: 18)
            }else{
                labTitle.font           = UIFont.boldSystemFont(ofSize: 18)
            }
            
            labTitle.autoresizingMask   = titleView.autoresizingMask
            
            let leftViewBounds:CGRect?   = navigationItem.leftBarButtonItem?.customView?.bounds
            let rightViewBounds:CGRect?  = navigationItem.rightBarButtonItem?.customView?.bounds
            
            if let leftViewBounds = leftViewBounds, let rightViewBounds = rightViewBounds {
                //maxWidth += 15;//leftview 左右都有间隙，左边是5像素，右边是8像素，加2个像素的阀值 5 ＋ 8 ＋ 2
                var maxWidth: CGFloat? = (leftViewBounds.size.width > rightViewBounds.size.width) ? leftViewBounds.size.width:rightViewBounds.size.width

                if maxWidth == nil{
                    maxWidth = 16;
                }else{
                    maxWidth = maxWidth! + 24.0 //经过测试，这个最合适
                }
                
                var frame = labTitle.frame
                frame.size.width = ScreenWidth - maxWidth! * 2
                labTitle.frame = frame
                frame = titleView.frame
                frame.size.width = ScreenWidth - maxWidth! * 2
                frame.origin.x = 15
                titleView.frame = frame
                labTitle.text = customTitle
                titleView.addSubview(labTitle)
            } else {
                print("leftViewBounds or rightViewBounds 为nil")
            }
            
            navigationItem.titleView = titleView
        }
    }
    
    //Mark: - 左边按钮 -- 文字
    var leftBarButtonItemText = ""{
        didSet{
            if leftBarButtonItemText == ""{
                navigationItem.leftBarButtonItem = nil
                return
            }
            
            let leftButton: UIButton = UIButton.init(type: UIButtonType.custom)
            let fontSize = CGFloat(15.0)
            
            if (Double(UIDevice.current.systemVersion) ?? 0.0) >= 9.0 {
                leftButton.titleLabel!.font = UIFont.init(name: "PingFang SC", size: fontSize)!
            } else {
                leftButton.titleLabel!.font = UIFont.boldSystemFont(ofSize: fontSize)
            }
            
            let rect = CGRect(x: 0, y: 0, width: fontSize * CGFloat(leftBarButtonItemText.characters.count) + 10.0, height: 44)
            leftButton.frame = rect
            leftButton.setTitle(leftBarButtonItemText, for: UIControlState.normal)
            leftButton.setTitleColor(UIColor.red, for: UIControlState.normal)
            
            leftButton.addTarget(self, action: #selector(self.leftBarAction), for: UIControlEvents.touchUpInside)
            let leftBarButtonItem:UIBarButtonItem = UIBarButtonItem.init(customView: leftButton)
            navigationItem.leftBarButtonItem = leftBarButtonItem
        }
    }
    
    //Mark: - 右边按钮 -- 文字
    var rightBarButtonItemText = ""{
        didSet{
            if rightBarButtonItemText == ""{
                navigationItem.rightBarButtonItem = nil
                return
            }
            
            let rightButton: UIButton = UIButton.init(type: UIButtonType.custom)
            let fontSize = CGFloat(15.0)
            
            if (Double(UIDevice.current.systemVersion) ?? 0.0) >= 9.0 {
                rightButton.titleLabel!.font = UIFont.init(name: "PingFang SC", size: fontSize)!
            } else {
                rightButton.titleLabel!.font = UIFont.boldSystemFont(ofSize: fontSize)
            }
            
            let rect = CGRect(x: 0, y: 0, width: fontSize * CGFloat(rightBarButtonItemText.characters.count) + 10.0, height: 44)
            rightButton.frame = rect
            rightButton.setTitle(rightBarButtonItemText, for: UIControlState.normal)
            rightButton.setTitleColor(UIColor.red, for: UIControlState.normal)
            
            rightButton.addTarget(self, action: #selector(self.leftBarAction), for: UIControlEvents.touchUpInside)
            let rightBarButtonItem: UIBarButtonItem = UIBarButtonItem.init(customView: rightButton)
            navigationItem.rightBarButtonItem = rightBarButtonItem
        }
    }
    
    //Mark: - 左边按钮 图片
    var leftBarButtonItemImage = UIImage(){
        didSet{
            let leftButton:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: leftBarButtonItemImage.size.width, height: leftBarButtonItemImage.size.height))
            leftButton.setImage(leftBarButtonItemImage, for: UIControlState.normal)
            leftButton.addTarget(self, action: #selector(self.leftBarAction), for: UIControlEvents.touchUpInside)
            leftButton.setImage(leftBarButtonItemImage, for: UIControlState.highlighted)
            let leftBarButtonItem:UIBarButtonItem = UIBarButtonItem.init(customView: leftButton)
            navigationItem.leftBarButtonItem = leftBarButtonItem
        }
    }
    
    //Mark: - 右边按钮 图片
    var rightBarButtonItemImage = UIImage(){
        didSet{
            let rightButton:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: rightBarButtonItemImage.size.width, height: rightBarButtonItemImage.size.height))
            rightButton.setImage(rightBarButtonItemImage, for: UIControlState.normal)
            rightButton.addTarget(self, action: #selector(self.rightBarAction), for: UIControlEvents.touchUpInside)
            rightButton.setImage(rightBarButtonItemImage, for: UIControlState.highlighted)
            let rightBarButtonItem:UIBarButtonItem = UIBarButtonItem.init(customView: rightButton)
            navigationItem.rightBarButtonItem = rightBarButtonItem
        }
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        
        let rect:CGRect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size);
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(NavBackColor.cgColor)
        context.fill(rect);
        let img:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        navigationController?.navigationBar.tintColor = UIColor.red
        navigationController?.navigationBar.setBackgroundImage(img, for: UIBarMetrics.default)
        navigationController?.navigationBar.backgroundColor = NavBackColor;
        navigationController?.navigationBar.isTranslucent = false
        tabBarController?.tabBar.isTranslucent = false
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isTranslucent = false
        
        leftBarButtonItemImage = UIImage(named: "common_ic_back")!
        //解决手势自动返回被屏蔽问题
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
        //无数据是覆盖view 通用
//        let tap = UITapGestureRecognizer(target: self, action: #selector(ClientHomeViewController.coverViewAction))
        coverView = UIView.init(frame: view.frame)
        coverView.isUserInteractionEnabled = true
//        coverView.addGestureRecognizer(tap)
        coverView.isHidden = isHiddenCoverView //默认隐藏 coverView
        coverView.backgroundColor = UIColor.white
        view.addSubview(coverView)
        
        coverLabel = UILabel.init(frame: CGRect.init(x: 0, y: 45, width: ScreenWidth, height: 100))
        coverLabel.numberOfLines = 0
        coverLabel.textAlignment = .center
        coverLabel.textColor = UIColor.lightGray
        coverLabel.font = UIFont.systemFont(ofSize: 14)
        coverLabel.center.x = view.center.x
        coverLabel.text = "暂无更多数据"
        coverView.addSubview(coverLabel)
        
    }
    
    // MARK: - set button action
    func leftBarAction()
    {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func rightBarAction()
    {
        
    }
    
    //MARK:- 拨打电话
    func dialTel(str: String) {
        UIApplication.shared.open(NSURL(string: "tel://" + str)! as URL, options: [:], completionHandler: nil)
    }
}






