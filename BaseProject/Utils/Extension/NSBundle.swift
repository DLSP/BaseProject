//
//  NSBundle.swift
//  FunctionAndExtend
//
//  Created by choice on 16/4/11.
//  Copyright © 2016年 choice. All rights reserved.
//

import UIKit

extension Bundle{
    class func load_nib<Type>(_ name : String, owner : AnyObject?) -> Type?{
        let array = Bundle.main.loadNibNamed(name, owner: owner, options: nil)
        if (array?.count)! > 0{
            return array?[0] as? Type
        }
        return nil
    }
}
