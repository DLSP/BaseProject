//
//  RegularExpression.swift
//  BaseProject
//
//  Created by scott on 16/9/28.
//  Copyright © 2016年 scott. All rights reserved.
//

import Foundation

//MARK: 常用正则表达式
struct RegularExpression {
    //手机号正则验证
    static func isValidateMobile(_ mobile: String) -> Bool {
        let phoneRegex = "^1[123456789]\\d{9}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: mobile)
    }
    
    //邮箱正则验证
    static func isValidateEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
    
    //身份证正则验证
    static func isCardId(_ cardid: String) -> Bool {
        let emailRegex = "(^\\d{15}$)|(^\\d{17}([0-9]|X)$)"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: cardid)
    }
}

//MARK: 自定义 正则表达式 比较操作符
//infix operator =~ {
//    associativity none
//    precedence 130
//}

precedencegroup ComparisonPrecedence {
    associativity: none
    higherThan: LogicalConjunctionPrecedence
}
infix operator =~ : ComparisonPrecedence

func =~(lhs: String, rhs: String) -> Bool {
    //自定义实现正则表达式
    struct RegexHelper {
        let regex: NSRegularExpression
        
        init(_ pattern: String) throws {
            try regex = NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        }
        
        func match(_ input: String) -> Bool {
            let matches = regex.matches(in: input, options: [], range: NSMakeRange(0, input.characters.count))
            return matches.count > 0
        }
    }
    
    do {
        return try RegexHelper(rhs).match(lhs)
    } catch _ {
        return false
    }
}
