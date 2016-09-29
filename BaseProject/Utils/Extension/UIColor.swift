//
//  UIColor.swift
//  FunctionAndExtend
//
//  Created by choice on 16/4/11.
//  Copyright © 2016年 choice. All rights reserved.
//

import UIKit

///16进制颜色转换
extension UIColor {
    class func colorFromHex(_ rgbValue: UInt32, alpha: Double = 1.0) -> UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/255.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/255.0
        let blue = CGFloat(rgbValue & 0xFF)/255.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
    class func colorWithRGB(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
    
    class func colorWithRGBA(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
    
    class func colorWithHex(_ hexStr: String) -> UIColor {
        var formatStr: String!
        if let index = hexStr.range(of: "0X") {
            formatStr = hexStr.substring(from: index.upperBound)
        } else if let index = hexStr.range(of: "#") {
            formatStr = hexStr.substring(from: index.upperBound)
        } else if hexStr.lengthOfBytes(using: String.Encoding.utf8) == 6 {
            formatStr = hexStr
        }
        
        if formatStr == nil {
            return UIColor.white
        }
        
        let rString = formatStr.substring(with: Range<String.Index>(formatStr.startIndex ..< formatStr.index(formatStr.startIndex, offsetBy: 2)))
        let gString = formatStr.substring(with: Range<String.Index>(formatStr.index(formatStr.startIndex, offsetBy: 2) ..< formatStr.index(formatStr.startIndex, offsetBy: 4)))
        let bString = formatStr.substring(with: Range<String.Index>(formatStr.index(formatStr.startIndex, offsetBy: 4) ..< formatStr.index(formatStr.startIndex, offsetBy: 6)))
        
        // Scan values
        var r: UInt32 = 0, g: UInt32 = 0, b: UInt32 = 0
        
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1.0)
    }
    
}

