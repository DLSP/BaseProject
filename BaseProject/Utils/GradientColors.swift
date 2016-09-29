//
//  GradientColors.swift
//  BaseProject
//
//  Created by scott on 16/9/28.
//  Copyright © 2016年 scott. All rights reserved.
//

import UIKit

//MARK: - 渐变色
public class GradientColors {
    ///渐变色
    static func DJgradientColors(frame: CGRect, colors: [CGColor]) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = frame
        return gradientLayer
    }
}
