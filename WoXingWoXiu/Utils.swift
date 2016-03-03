//
//  Utils.swift
//  WoXingWoXiu
//
//  Created by 刘剑文 on 16/2/22.
//  Copyright © 2016年 kevinil. All rights reserved.
//

import UIKit

public func setColorNavBar(vc: UIViewController) {
    let navBar = vc.navigationController?.navigationBar
    navBar?.barTintColor = Colors.red
    navBar?.tintColor = .whiteColor()
    navBar?.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
}

public func HiddenBackNavTitle(vc: UIViewController) {
    vc.navigationController?.navigationBar.topItem?.backBarButtonItem =
        UIBarButtonItem(title: "   ", style: .Plain, target: vc, action: nil)
}

public struct Colors {
    static let red = UIColor(red: 246/255, green: 94/255, blue: 76/255, alpha: 1)
    static let green = UIColor(red: 3/255, green: 171/255, blue: 9/255, alpha: 1)
    static let orange = UIColor(red: 253/255, green: 145/255, blue: 44/255, alpha: 1)
    static let blue = UIColor(red: 90/255, green: 172/255, blue: 226/255, alpha: 1)
}

public func cutTextField(textField: UITextField, limitLength: Int, cutIndex: Int) {
    let currentLength = textField.text!.lengthOfBytesUsingEncoding(NSUnicodeStringEncoding)
    let currentRange = textField.markedTextRange
    if currentRange == nil {
        if currentLength > limitLength {
            let willCutIndex = textField.text!.startIndex.advancedBy(cutIndex)
            textField.text = textField.text!.substringToIndex(willCutIndex)
        }
    }
}

public func cutTextField(textField: UITextField, removeLength: Int) {
    for _ in 0..<removeLength {
        textField.text?.removeAtIndex(textField.text!.endIndex)
    }
}

public func addRedAlertAction(alert: UIAlertController, title: String, handler: ((UIAlertAction!) -> Void)!) {
    alert.addAction(UIAlertAction(title: title, style: UIAlertActionStyle.Destructive, handler: handler))
}

public func addAlertAction(alert: UIAlertController, title: String, handler: ((UIAlertAction!) -> Void)!) {
    alert.addAction(UIAlertAction(title: title, style: UIAlertActionStyle.Default, handler: handler))
}

public func addCancelAlertAction(alert: UIAlertController, title: String, handler: ((UIAlertAction!) -> Void)!) {
    alert.addAction(UIAlertAction(title: title, style: UIAlertActionStyle.Cancel, handler: handler))
}

public func creatButton(vc: UIViewController, title: String, originY : CGFloat) -> UIButton {
    let buttonView = UIView(frame: CGRectMake(0, originY, vc.view.bounds.width, 150))
    let btn = UIButton(type: .System)
    btn.frame = CGRectMake(15, 45, vc.view.bounds.width - 30, 50)
    btn.backgroundColor = Colors.red
    btn.layer.cornerRadius = 25
    btn.setTitle(title, forState: .Normal)
    btn.tintColor = UIColor.whiteColor()
    buttonView.addSubview(btn)
    vc.view.addSubview(buttonView)
    return btn
}


