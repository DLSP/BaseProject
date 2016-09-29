//
//  Macro.swift
//  WindWardBaseProject
//
//  Created by choice on 16/5/19.
//  Copyright © 2016年 choice. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    func hasNewMsg(noti: NSNotification){
        if (noti.object as! Bool) == true {
            self.tabBar.items![2].badgeValue = nil
        }else{
            self.tabBar.items![2].badgeValue = ""

        }
    }
}

extension TabBarController: UITabBarControllerDelegate{
    // Tab Bar Controller Delegate
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let index: Int? = viewControllers?.index(of: viewController)
        if let idx = index {
            switch idx {
            case 0:
                
                return true
            case 1:
                
                return true
            case 2:
                
                return true
            case 3:
                
                return true
            case 4:
                
                return true
            default:
                break
            }
        }
        return false
    }
}














