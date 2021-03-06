//
//  StyleKit.swift
//  HNTVLoadingDemo
//
//  Created by pengxianhe on 16/6/25.
//  Copyright (c) 2016 pengxinahe. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//



import UIKit

public class StyleKit : NSObject {

    //// Drawing Methods

    public class func drawLoading(loadingColor loadingColor: UIColor = UIColor(red: 0.981, green: 0.700, blue: 0.047, alpha: 1.000), progress: CGFloat = 0.167) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()


        //// Variable Declarations
        let dash: CGFloat = -280 * progress * progress + 280 * progress
        let angle: CGFloat = (progress < 0.5 ? 0 : (progress - 0.5) * 2) * -360

        //// Oval Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 25, 25)
        CGContextRotateCTM(context, -(angle + 90) * CGFloat(M_PI) / 180)

        let ovalPath = UIBezierPath()
        ovalPath.moveToPoint(CGPoint(x: 22, y: 0))
        ovalPath.addCurveToPoint(CGPoint(x: -0, y: 22), controlPoint1: CGPoint(x: 22, y: 12.15), controlPoint2: CGPoint(x: 12.15, y: 22))
        ovalPath.addCurveToPoint(CGPoint(x: -22, y: 0), controlPoint1: CGPoint(x: -12.15, y: 22), controlPoint2: CGPoint(x: -22, y: 12.15))
        ovalPath.addCurveToPoint(CGPoint(x: 0, y: -22), controlPoint1: CGPoint(x: -22, y: -12.15), controlPoint2: CGPoint(x: -12.15, y: -22))
        ovalPath.addCurveToPoint(CGPoint(x: 22, y: 0), controlPoint1: CGPoint(x: 12.15, y: -22), controlPoint2: CGPoint(x: 22, y: -12.15))
        ovalPath.closePath()
        ovalPath.lineCapStyle = .Round;

        loadingColor.setStroke()
        ovalPath.lineWidth = 4
        CGContextSaveGState(context)
        CGContextSetLineDash(context, 1, [dash, 139], 2)
        ovalPath.stroke()
        CGContextRestoreGState(context)

        CGContextRestoreGState(context)
    }

}
