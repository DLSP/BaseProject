//
//  UIImage.swift
//  FunctionAndExtend
//
//  Created by choice on 16/4/11.
//  Copyright © 2016年 choice. All rights reserved.
//

import UIKit
import ImageIO

//MARK:修改图片转向问题
extension UIImage {
    func fixOrientation() -> UIImage {
        if (self.imageOrientation == .up) {
            return self
        }
        var transform = CGAffineTransform.identity
        switch (self.imageOrientation) {
        case .down, .downMirrored:
            transform = transform.translatedBy(x: self.size.width, y: self.size.height)
            transform = transform.rotated(by: CGFloat(M_PI))
            break
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: self.size.width, y: 0)
            transform = transform.rotated(by: CGFloat(M_PI_2))
            break
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: self.size.height)
            transform = transform.rotated(by: CGFloat(-M_PI_2))
            break
        default:
            break
        }
        switch (self.imageOrientation) {
        case .upMirrored, .downMirrored:
            transform = transform.translatedBy(x: self.size.width, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
            break
        case .leftMirrored, .rightMirrored:
            transform = transform.translatedBy(x: self.size.height, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
            break
        default:
            break
        }
        let ctx = CGContext(data: nil, width: Int(self.size.width), height: Int(self.size.height),
                                        bitsPerComponent: (self.cgImage?.bitsPerComponent)!, bytesPerRow: 0,
                                        space: (self.cgImage?.colorSpace!)!,
                                        bitmapInfo: (self.cgImage?.bitmapInfo.rawValue)!)
        ctx?.concatenate(transform)
        switch (self.imageOrientation) {
        case .left, .leftMirrored, .right, .rightMirrored:
            ctx?.draw(self.cgImage!, in: CGRect(x: 0,y: 0,width: self.size.height,height: self.size.width))
            break
        default:
            ctx?.draw(self.cgImage!, in: CGRect(x: 0,y: 0,width: self.size.width,height: self.size.height))
            break
        }
        // And now we just create a new UIImage from the drawing context
        let cgimg = ctx?.makeImage()
        return UIImage(cgImage: cgimg!)
    }
}


//MARK: 用颜色创建图片
extension UIImage{
    static func createImageWithColor(_ color: UIColor) ->UIImage{
        let rect = CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width / 4, height: 49)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let theImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return theImage!
    }
}

//MAKR: 圆角
extension UIImage{
    class func maskRoundedImage(_ image: UIImage, radius: Float) -> UIImage {
        let imageView = UIImageView(image: image)
        let layer = imageView.layer
        layer.masksToBounds = true
        layer.cornerRadius = CGFloat(radius)
        UIGraphicsBeginImageContext(imageView.bounds.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let roundedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return roundedImage!
    }
    
    class func roundedRectImageFromImage(_ image:UIImage,imageSize:CGSize,cornerRadius:CGFloat)->UIImage{
        UIGraphicsBeginImageContextWithOptions(imageSize,false,0.0)
        let bounds=CGRect(origin: CGPoint.zero, size: imageSize)
        UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).addClip()
        image.draw(in: bounds)
        let finalImage=UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return finalImage!
    }
}

//MARK: 通过 角度 旋转图片
extension UIImage{
    /**
     通过 角度 旋转图片
     - parameter degrees: 角度值
     - returns: 新的image
     */
    func imageRotatedByDegrees(_ degrees:Int) -> UIImage {
        let width = self.cgImage?.width
        let height = self.cgImage?.height
        let rotatedSize = CGSize(width: CGFloat(width!), height: CGFloat(height!))
        UIGraphicsBeginImageContext(rotatedSize)
        let bitmap = UIGraphicsGetCurrentContext()
        bitmap?.translateBy(x: rotatedSize.width/2, y: rotatedSize.height/2);
        bitmap?.rotate(by: CGFloat(degrees) * CGFloat(M_PI) / 180);
        bitmap?.rotate(by: CGFloat(M_PI));
        bitmap?.scaleBy(x: -1.0, y: 1.0);
        bitmap?.draw(self.cgImage!, in: CGRect(x: -rotatedSize.width/2, y: -rotatedSize.height/2, width: rotatedSize.width, height: rotatedSize.height));
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}

//MARK: 图片滤镜处理
extension UIImageView {
    // 怀旧 --> CIPhotoEffectInstant                         单色 --> CIPhotoEffectMono
    // 黑白 --> CIPhotoEffectNoir                            褪色 --> CIPhotoEffectFade
    // 色调 --> CIPhotoEffectTonal                           冲印 --> CIPhotoEffectProcess
    // 岁月 --> CIPhotoEffectTransfer                        铬黄 --> CIPhotoEffectChrome
    // CILinearToSRGBToneCurve, CISRGBToneCurveToLinear, CIGaussianBlur, CIBoxBlur, CIDiscBlur, CISepiaTone, CIDepthOfField
    func filterWithOriginalImage(filterName name: String) -> UIImage {
        let context = CIContext()
        let inputImage = CIImage.init(image: self.image!)
        let filter = CIFilter.init(name: name)!
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        
        let result = filter.value(forKey: kCIOutputImageKey) as! CIImage
        let cgImage = context.createCGImage(result, from: result.extent)
        let resultImage = UIImage.init(cgImage: cgImage!)
        return resultImage
    }
}

//MARK: 图片模糊处理
extension UIImageView {
    // CIGaussianBlur ---> 高斯模糊
    // CIBoxBlur      ---> 均值模糊(Available in iOS 9.0 and later)
    // CIDiscBlur     ---> 环形卷积模糊(Available in iOS 9.0 and later)
    // CIMedianFilter ---> 中值模糊, 用于消除图像噪点, 无需设置radius(Available in iOS 9.0 and later)
    // CIMotionBlur   ---> 运动模糊, 用于模拟相机移动拍摄时的扫尾效果(Available in iOS 9.0 and later)
    func blurWithOriginalImage(blurName name: String, radius radiu: Int?) -> UIImage? {
        let context = CIContext()
        let inputImage = CIImage.init(image: self.image!)
        var filter: CIFilter!
        
        if (name.characters.count != 0) {
            filter = CIFilter.init(name: name)
            filter.setValue(inputImage, forKey: kCIInputImageKey)
            if !(name == "CIMedianFilter") {
                filter.setValue(radiu, forKey: "inputRadius")
            }
            let result = filter.value(forKey: kCIOutputImageKey) as! CIImage
            let cgImage = context.createCGImage(result, from: result.extent)
            let resultImage = UIImage.init(cgImage: cgImage!)
            return resultImage
        }else{
            return nil
        }
    }
    
}

//MARK: - 按比例压缩图片
extension UIImage {
    static func scaleFromImage(_ image: UIImage, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

