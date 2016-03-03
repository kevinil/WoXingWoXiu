//
//  GradientView.swift
//  WoXingWoXiu
//
//  Created by 刘剑文 on 16/2/23.
//  Copyright © 2016年 kevinil. All rights reserved.
//

import UIKit

class GradientView: UIView {


    override func drawRect(rect: CGRect) {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let context = UIGraphicsGetCurrentContext()
        
        let startColor = UIColor.blackColor() //UIColor(red: 0.1, green: 0.1, blue: 0.8, alpha: 1)
        let endColor = UIColor.clearColor() //UIColor(red: 1, green: 0.6, blue: 0.8, alpha: 1)
        
        let gradient = CGGradientCreateWithColors(colorSpace, [startColor.CGColor, endColor.CGColor], [0, 0.5])
        
        let topPoint = CGPointMake(self.bounds.width / 2, 0)
        let bottomPoint = CGPointMake(self.bounds.width / 2, self.bounds.height)
        
        //        let pathRect = CGRectInset(self.bounds, 20, 20)
        //        let roundedRectanglePath = UIBezierPath(roundedRect: pathRect, cornerRadius: 4)
        
        CGContextSaveGState(context)
        //        roundedRectanglePath.addClip()
        CGContextDrawLinearGradient(context, gradient, bottomPoint, topPoint, CGGradientDrawingOptions.DrawsBeforeStartLocation)
        CGContextRestoreGState(context)
    }


}
