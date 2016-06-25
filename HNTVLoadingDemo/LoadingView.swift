//
//  LoadingView.swift
//  HNTVLoadingDemo
//
//  Created by 彭显鹤 on 16/6/25.
//  Copyright © 2016年 彭显鹤. All rights reserved.
//

import UIKit
import pop

@IBDesignable

class LoadingView: UIView {

    var loadingColor: UIColor = UIColor.orangeColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var progress: CGFloat = 0.5 {
        didSet {
            setNeedsDisplay()
        }
    }

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        StyleKit.drawLoading(loadingColor: loadingColor, progress: progress)
    }
    
    override func awakeFromNib() {
         super.awakeFromNib()
        addAnimation()
    }
    
    func addAnimation() {
        let anim = POPBasicAnimation()
        anim.duration = 1
        anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        let prop = POPAnimatableProperty.propertyWithName("progress", initializer: { props in
            
            props.readBlock = { obj, values in
                values[0] = (obj as! LoadingView).progress
            }
            props.writeBlock = { obj, values in
                (obj as! LoadingView).progress = values[0]
            }
            
            props.threshold = 0.01
            
        }) as! POPAnimatableProperty
        
        anim.property = prop
        anim.repeatForever = true
        anim.fromValue = 0.0
        anim.toValue = 1.0
        
        pop_addAnimation(anim, forKey: "progress")
    }
    
}
