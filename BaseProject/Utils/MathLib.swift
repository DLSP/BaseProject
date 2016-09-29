//
//  MathLib.swift
//  BaseProject
//
//  Created by scott on 16/9/28.
//  Copyright © 2016年 scott. All rights reserved.
//

import UIKit

class MathLib{
    func calculateControlPnt1(_ p1: CGPoint,p2: CGPoint ,p3: CGPoint,s: CGFloat) -> CGPoint {
        let q1: CGPoint = wypAdd(p1, p2: wypMul2(wypSub(p2, p2: p1), s: s))
        let q2: CGPoint = wypAdd(p2, p2: wypMul2(wypSub(p3, p2: p2), s: s))
        return wypAdd(q1, p2: wypMul2(wypSub(q2, p2: q1), s: s))
    }
    
    func calculateControlPnt2(_ p1: CGPoint, p2: CGPoint, p3: CGPoint, s: CGFloat) -> CGPoint  {
        let q2: CGPoint = wypAdd(p2, p2: wypMul2(wypSub(p3, p2: p2), s: s))
        return q2
    }
    
    func wypMul2(_ p1: CGPoint, s: CGFloat) -> CGPoint {
        return wyp(p1.x * s, y: p1.y * s)
    }
    
    func wypAdd(_ p1: CGPoint, p2: CGPoint) -> CGPoint {
        return wyp(p1.x + p2.x, y: p1.y + p2.y)
    }
    
    func wypSub(_ p1: CGPoint, p2: CGPoint) -> CGPoint {
        return wyp(p1.x - p2.x, y: p1.y - p2.y)
    }
    
    func wypMidpoint(_ v1: CGPoint, v2: CGPoint) -> CGPoint {
        return wypMul2(wypAdd(v1, p2: v2), s: 0.5)
    }
    
    func wyp(_ x: CGFloat, y: CGFloat) -> CGPoint {
        return CGPoint(x: x, y: y)
    }
    
    func wypRotateByAngle(_ v: CGPoint, pivot: CGPoint, angle: Float) -> CGPoint {
        var r: CGPoint = v
        r = wypSub(r, p2: pivot)
        let t: CGFloat = r.x
        let cosa = cosf(angle)
        let sina = sinf(angle)
        r.x = t * CGFloat(cosa) - r.y * CGFloat(sina)
        r.y = t * CGFloat(sina) + r.y * CGFloat(cosa)
        r = wypAdd(r, p2: pivot)
        return r
    }
}
