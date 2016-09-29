//
//  UINavigationBar.swift
//  FunctionAndExtend
//
//  Created by choice on 16/4/14.
//  Copyright © 2016年 choice. All rights reserved.
//

import UIKit

// MARK: - 隐藏导航栏下面横线
extension UINavigationBar {
    func hideBottomHairline() {
        let navigationBarImageView = hairlineImageViewInNavigationBar(self)
        navigationBarImageView!.isHidden = true
    }
    
    func showBottomHairline() {
        let navigationBarImageView = hairlineImageViewInNavigationBar(self)
        navigationBarImageView!.isHidden = false
    }
    
    fileprivate func hairlineImageViewInNavigationBar(_ view: UIView) -> UIImageView? {
        if view.isKind(of: UIImageView.self) && view.bounds.height <= 1.0 {
            return (view as! UIImageView)
        }
        
        let subviews = (view.subviews as [UIView])
        for subview: UIView in subviews {
            if let imageView: UIImageView = hairlineImageViewInNavigationBar(subview) {
                return imageView
            }
        }
        return nil
    }
    
}

//改变颜色
extension UINavigationBar {
    
    class func setupStyle() {
        let navBar = UINavigationBar.appearance()
        navBar.tintColor = UIColor.white
        navBar.barTintColor = UIColor(red: 212 / 255.0, green: 25 / 255.0, blue: 38 / 255.0, alpha: 1.0)
        navBar.isTranslucent = false
        
        let attr = [
            NSForegroundColorAttributeName : UIColor.white
        ]
        navBar.titleTextAttributes = attr
        
    }
    
}
