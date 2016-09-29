//
//  DateFormatTranstion.swift
//  BaseProject
//
//  Created by scott on 16/9/28.
//  Copyright © 2016年 scott. All rights reserved.
//

import UIKit

//MARK: - 日期格式、GTM UTC 转换为 本地时间格式
public class DateFormatTranstion {
    
    ///转换UTC、GMT 为本地时间格式
    static func transformUTCAndGTMFormat(dateUTC: String, dateFormat: String? = "yyyy-MM-dd") -> String{
        let dateFormatter = DateFormatter.init()
        //输入格式
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.timeZone = NSTimeZone.local
        
        let dated = dateFormatter.date(from: dateUTC)
        
        //输出格式
        dateFormatter.dateFormat = dateFormat
        
        if let dated = dated {
            let dateString = dateFormatter.string(from: dated)
            return dateString
        } else {
            return ""
            
        }
    }
    
    ///判断当地时间是上午还是下午
    static func amAndPmJudge() -> String{
        let nowDate = NSDate()
        let localZone = NSTimeZone.local
        
        let format = DateFormatter()
        format.timeZone = localZone
        _ = format.string(from: nowDate as Date)
        
        format.dateFormat = "aaa"
        let amOrPm = format.string(from: nowDate as Date)
        if amOrPm == "AM" {
            return "上午"
        } else {
            return "下午"
        }
    }
    
    ///比较两个日期的大小
    static func compareDateLength(first: String, second: String, dateFormat: String? = Common.DateFormat.yyyy_MM_dd.rawValue) -> Bool {
        let format = DateFormatter()
        format.timeZone = NSTimeZone.local
        format.dateFormat = dateFormat
        
        if !first.isEmpty && !second.isEmpty {
            if format.date(from: first)!.compare(format.date(from: second)!).rawValue == -1 {
                return true
            } else {
                return false
            }
        } else {
            return true
        }
    }
}
