//
//  UIView.swift
//  FunctionAndExtend
//
//  Created by choice on 16/4/11.
//  Copyright © 2016年 choice. All rights reserved.
//

import UIKit


extension UIView{
    
    func findView<Type>()->Type?{
        var obj = self
        while let s = obj.superview{
            if let t = s.superview as? Type{
                return t
            }
            obj = s
        }
        return nil
    }
    
    func findChild<Type>()->Type?{
        func find(_ view : UIView) -> Type?{
            for v in view.subviews{
                if let result = v as? Type{
                    return result
                }else{
                    if let f = find(v){
                        return f
                    }
                }
            }
            return nil
        }
        return find(self)
    }
}

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}
