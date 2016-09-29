//
//  UIScrollView.swift
//  FunctionAndExtend
//
//  Created by choice on 16/4/14.
//  Copyright © 2016年 choice. All rights reserved.
//

import UIKit

extension UIScrollView {
    ///滚动到最上方
    func scrollToTop(){
        scrollToTopAnimated(true)
    }
    
    ///滚动到最下方
    func scrollToBottom(){
        scrollToBottomAnimated(true)
    }
    
    ///滚动到最左方
    func scrollToLeft(){
        scrollToLeftAnimated(true)
    }
    
    ///滚动到最右方
    func scrollToRight(){
        scrollToRightAnimated(true)
    }
    
    func scrollToTopAnimated(_ animated: Bool) {
        var off: CGPoint = contentOffset
        off.y = 0 - contentInset.top
        setContentOffset(off, animated: animated)
    }
    
    func scrollToBottomAnimated(_ animated: Bool){
        var off: CGPoint = contentOffset
        off.y = contentSize.height - bounds.size.height + contentInset.bottom
        setContentOffset(off, animated: animated)
    }
    
    func scrollToLeftAnimated(_ animated: Bool){
        var off: CGPoint = contentOffset
        off.x = 0 - contentInset.left
        setContentOffset(off, animated: animated)
    }
    
    func scrollToRightAnimated(_ animated: Bool){
        var off: CGPoint = contentOffset
        off.x = contentSize.width - bounds.size.width + contentInset.right
        setContentOffset(off, animated: animated)
    }
}


//处理键盘弹出时点击uiscrollview,uitablview的键盘回收问题
extension UIScrollView {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        next?.touchesBegan(touches, with: event)
        super.touchesBegan(touches, with: event)
    }
    
    open override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        next?.touchesMoved(touches, with: event)
        super.touchesMoved(touches, with: event)
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        next?.touchesEnded(touches, with: event)
        super.touchesEnded(touches, with: event)
    }
}
