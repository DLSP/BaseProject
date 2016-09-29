//
//  FetchUserLoginInfo.swift
//  BaseProject
//
//  Created by scott on 16/9/28.
//  Copyright © 2016年 scott. All rights reserved.
//

import Foundation

//MARK: - 获取用户登录信息
public class FetchUserLoginInfo {
    
    static func userModel() -> LoginModel? {
        if let data = UserDefaults.standard.data(forKey: "") {
            let loginModel = (NSKeyedUnarchiver.unarchiveObject(with: data) as? LoginModel)!
            return loginModel
        } else {
            return nil
        }
    }
}
