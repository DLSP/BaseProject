//
//  UIApplication.swift
//  FunctionAndExtend
//
//  Created by choice on 16/4/21.
//  Copyright © 2016年 choice. All rights reserved.
//

import UIKit

extension UIApplication {
    
//    static let appBundleName = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName")
//    
//    
//    static let appBundleID = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleIdentifier")
//    
//    static let appVersion = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString")
//    
//    static let appBuildVersion = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleVersion")
    
//    static func getAppBudleName(){
//         let appBundleName = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName")

//    }
    
    
    
//    static let appBundleID = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleIdentifier")
//    
//    static let appVersion = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString")
//    
//    static let appBuildVersion = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleVersion")
    
    class func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
}

struct Alert {
    
    static func showInfo(_ title: String, message: String? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default) { _ in })
        UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
    }

}
