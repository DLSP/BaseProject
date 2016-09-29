//
//  CustomAlertViewController.swift
//  BaseProject
//
//  Created by scott on 16/9/28.
//  Copyright © 2016年 scott. All rights reserved.
//

import UIKit

//MARK: 便捷AlertViewcontroller提示弹框
public class CustomAlertViewController {
    
    static var comfirm: (() -> ())? //点击确认闭包
    static var cancel: (() -> ())?  //点击取消闭包
    
    ///确认+取消 返回alertVC
    static func alertViewController(_ alertVCType: UIAlertControllerStyle, alertVCtitle: String? = nil, alertVCmessage: String? = nil,  actionConfirmTitle: String? = nil, actionCancelTitle: String? = nil) -> UIAlertController {
        let alertVC = UIAlertController.init(title: alertVCtitle, message: alertVCmessage, preferredStyle: alertVCType)
        let alertAction = UIAlertAction(title: actionConfirmTitle, style: .default) { (UIAlertAction) -> Void in
            self.comfirm?()
        }
        let alertAction1 = UIAlertAction(title: actionCancelTitle, style: .cancel) { (UIAlertAction) -> Void in
            self.cancel?()
        }
        alertVC.addAction(alertAction)
        alertVC.addAction(alertAction1)
        return alertVC
    }
    
    ///无网络时便捷弹框
    class func noNetworkAlertView(_ viewController: UIViewController? = nil) -> UIAlertController? {
        let alertVC = UIAlertController.init(title: "", message: "请检查你的网络", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "确认", style: .default) { (UIAlertAction) -> Void in
            self.comfirm?()
        }
        let alertAction1 = UIAlertAction(title: "取消", style: .cancel) { (UIAlertAction) -> Void in
            self.cancel?()
        }
        alertVC.addAction(alertAction)
        alertVC.addAction(alertAction1)
        
        if viewController == nil {
            return alertVC
        }else{
            viewController!.present(alertVC, animated: true, completion: nil)
            return nil
        }
    }
}
