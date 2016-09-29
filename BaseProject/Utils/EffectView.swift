//
//  EffectView.swift
//  BaseProject
//
//  Created by scott on 16/9/28.
//  Copyright © 2016年 scott. All rights reserved.
//

import UIKit

//MARK: 毛玻璃模糊效果
struct EffectView {
    static func effectViewWithFrame(_ frame: CGRect) -> UIVisualEffectView {
        let effect = UIBlurEffect.init(style: .light)
        let effectView = UIVisualEffectView.init(effect: effect)
        effectView.frame = frame
        return effectView
    }
}
