//
//  NSDate.swift
//  FunctionAndExtend
//
//  Created by choice on 16/4/11.
//  Copyright © 2016年 choice. All rights reserved.
//

import UIKit


///时间 -> 字符串 格式转换
extension Date {
    func toString(_ format: String? = "yyyy-MM-dd") -> String {
        let dateFmt = DateFormatter()
        dateFmt.timeZone = TimeZone.current
        if let fmt = format {
            dateFmt.dateFormat = fmt
        }
        return dateFmt.string(from: self)
    }
    
    func isSameDate(_ date: Date) -> Bool {
        return self.toString() == date.toString()
    }
    
    //时间戳转换Date
    func toDate(_ timeStamp: String) -> Date {
        let stampTimeStr = NSString(string: timeStamp)
        let interval: TimeInterval = stampTimeStr.doubleValue
        
        let dateTime = Date(timeIntervalSince1970: interval)
        
        return dateTime
    }
    
    //时间相加
    
    //时间相减
}
