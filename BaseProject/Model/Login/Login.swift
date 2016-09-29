//
//  Login.swift
//  BaseProject
//
//  Created by scott on 16/9/28.
//  Copyright © 2016年 scott. All rights reserved.
//

import UIKit
//import ObjectMapper

class LoginModel: NSObject, NSCoding {
    var account = ""
    var password = ""
    
    override init() { }
    
//    required init?(_ map: Map) { }
    
//    func mapping(map: Map) {
//        branchName  <- map["branchName"]
//        branchNo    <- map["branchNo"]
//    }
    
    //归档
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(account, forKey: "account")
        aCoder.encode(password, forKey: "password")
    }
    
    //解档
    required init(coder aDecoder: NSCoder) {
        account  = (aDecoder.decodeObject(forKey: "account") as? String) ?? ""
        password = (aDecoder.decodeObject(forKey: "password") as? String) ?? ""
    }
}
