//
//  SeparatorLine.swift
//  MountEmei
//
//  Created by Kuma on 3/10/15.
//  Copyright (c) 2015 Xiong Jiecheng. All rights reserved.
//

import Foundation
import UIKit

//MARK: - UIView 继承这个类，就能实现 高度 0.5  (比如：cell的分割线)
class SeparatorLine: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        for constraint in self.constraints {
            if constraint.firstAttribute == NSLayoutAttribute.height && constraint.constant == 1 {
                (constraint ).constant = constraint.constant / UIScreen.main.scale
            } else if constraint.firstAttribute == NSLayoutAttribute.width && constraint.constant == 1 {
                (constraint ).constant = constraint.constant / UIScreen.main.scale
            }
        }
    }
}

//MARK: - UIView 继承这个类，就能实现 宽度 0.5  (比如：竖线)
class SeparatorWidthLine: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        for constraint in self.constraints {
            if constraint.firstAttribute == NSLayoutAttribute.width && constraint.constant == 1 {
                (constraint ).constant = constraint.constant / UIScreen.main.scale
            }
        }
    }
}
