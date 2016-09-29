//
//  String.swift
//  FunctionAndExtend
//
//  Created by choice on 16/4/11.
//  Copyright © 2016年 choice. All rights reserved.
//

import UIKit


///字符串 -> 时间 格式转换
extension String {
    func toDate(_ format: String = "yyyy-MM-dd") -> Date? {
        let dateFmt = DateFormatter()
        dateFmt.timeZone = TimeZone.current
        dateFmt.dateFormat = format
        return dateFmt.date(from: self)
    }
}

// MARK: - 支持 字符串 转换 颜色
extension String {
    func colorTransition() -> UIColor{
        //修剪字符串两边空格，并 有“ ” 分割字符串
        let strArr = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).components(separatedBy: " ")
        
        if !strArr.contains(""){
            if strArr.count <= 3 {
                return UIColor(red: CGFloat(Double(strArr[0])!) / 255.0, green: CGFloat(Double(strArr[1])!) / 255.0, blue: CGFloat(Double(strArr[2])!) / 255.0, alpha: 1.0)
            }else if strArr.count >= 4{
                return UIColor(red: CGFloat(Double(strArr[0])!) / 255.0, green: CGFloat(Double(strArr[1])!) / 255.0, blue: CGFloat(Double(strArr[2])!) / 255.0, alpha: CGFloat(Double(strArr[3])!))
            }else {
                var cString: String! = ""
                
                if strArr[0].characters.count >= 2 {
                    cString = strArr[0].uppercased().substring(from: strArr[0].characters.index(strArr[0].startIndex, offsetBy: 2))
                }
                
                if strArr[0].characters.count != 6 {
                    if let rootVC = appdelegate.window?.rootViewController {
                        Common.showAlert(vc: rootVC, msg: "十六进制颜色格式不对，请输入正确格式")
                        return UIColor.white
                    }
                }
                
                let rString = cString.substring(to: cString.index(cString.startIndex, offsetBy: 2))
                let gString = cString.substring(from: cString.index(cString.startIndex, offsetBy: 2)).substring(to: cString.index(cString.startIndex, offsetBy: 2))
                let bString = cString.substring(from: cString.index(cString.startIndex, offsetBy: 4)).substring(to: cString.index(cString.startIndex, offsetBy: 2))
                
                var r: UInt32 = 0
                var g: UInt32 = 0
                var b: UInt32 = 0
                Scanner(string: rString).scanHexInt32(&r)
                Scanner(string: gString).scanHexInt32(&g)
                Scanner(string: bString).scanHexInt32(&b)
                
                if strArr.count > 1{
                    return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(Double(strArr[1])!))
                }else{
                    return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
                }
            }
        }else{
            if let rootVC = appdelegate.window?.rootViewController {
                Common.showAlert(vc: rootVC, msg: "颜色格式不对，请仅以空格分割参数")
                return UIColor.white
            } else {
                return UIColor.white
            }
        }
    }
}
