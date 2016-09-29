//
//  Array.swift
//  FunctionAndExtend
//
//  Created by Scott on 16/6/2.
//  Copyright © 2016年 choice. All rights reserved.
//

import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


// MARK: - 返回数组的最大值和其下标、最小值和其下标
extension Array {
    ///返回最大值、下标
    func maxIndexAndValue() -> (index: Int, value: Double){
        return maxWithMin(true, array: self)
    }
    
    ///返回最小值、下标
    func minIndexAndValue() -> (index: Int, value: Double){
        return maxWithMin(false, array: self)
    }
    
    fileprivate func maxWithMin(_ isMax: Bool, array: Array) -> (index: Int, value: Double) {
        var tempValue: (Int, Double)!
        
        if (array.first as? Double) == nil{
            if let intFirst = (array.first as? Int){
                tempValue = (0, Double.init(intFirst))
            }else if let strFirst = (array.first as? String){
                tempValue = (0, Double.init(strFirst)!)
            }else{
                tempValue = (0, (array.first as! Double))
            }
        }
        
        for (index, _) in array.enumerated() {
                if array.count > index + 1{
                    var nextValue = (array[index + 1] as? Double)
                    if (nextValue ?? nil) == nil {
                        if let intValue = (array[index + 1] as? Int){
                            nextValue = Double.init(intValue)
                        }else if let strValue = (array[index + 1] as? String){
                            nextValue = Double.init(strValue)
                        }else{
                            break
                        }
                    }
                    
                    if isMax == true{
                        if tempValue.1 > nextValue{
                            tempValue = (tempValue.0, tempValue.1)
                        }else{
                            tempValue = (index + 1, nextValue!)
                        }
                    }else{
                        if tempValue.1 < nextValue{
                            tempValue = (tempValue.0, tempValue.1)
                        }else{
                            tempValue = (index + 1, nextValue!)
                        }
                    }
                }
            }
            return (tempValue.0, tempValue.1)
    }
}


