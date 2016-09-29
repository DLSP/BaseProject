//
//  UITabBar.swift
//  FunctionAndExtend
//
//  Created by choice on 16/4/11.
//  Copyright © 2016年 choice. All rights reserved.
//

import UIKit


///tabbar显示、隐藏红点
extension UITabBar{
    ///展示小红点
    func showBadgeOnItemIndex(_ index: CGFloat) {
        removeBadgeOnItemIndex(index)
        
        let tabFrame = self.frame
        let tabbarItemNums: CGFloat = 4
        
        //新建小红点
        let badgeView = UIView()
        badgeView.tag = 555 + Int(index)
        badgeView.layer.cornerRadius = 5//圆形
        badgeView.backgroundColor = UIColor.red//颜色：红色
        
        //确定小红点的位置
        let percentX = (index + 0.6) / tabbarItemNums
        let x = CGFloat(ceilf(Float(percentX * tabFrame.size.width)))
        let y = CGFloat(ceilf(Float(CGFloat(0.1) * tabFrame.size.height)))
        badgeView.frame = CGRect(x: x, y: y, width: 10, height: 10)//圆形大小为10
        addSubview(badgeView)
    }
    
    //隐藏小红点
    func hiddenBadgeOnItemIndex(_ index: CGFloat) {
        removeBadgeOnItemIndex(index)
    }
    
    //移除小红点
    func removeBadgeOnItemIndex(_ index: CGFloat){
        for subView in self.subviews {
            if subView.tag == (555 + Int(index)) {
                subView.removeFromSuperview()
            }
        }
    }
}

extension UITabBar {
    //改变文字的色彩
    class func setupStyle() {
        
        let tabBarItem = UITabBarItem.appearance()
        
        let selectedAttr = [
            NSForegroundColorAttributeName : UIColor(red: 212 / 255.0, green: 25 / 255.0, blue: 38 / 255.0, alpha: 1.0)
        ]
        
        tabBarItem.setTitleTextAttributes(selectedAttr, for: .selected)
        
    }
}
