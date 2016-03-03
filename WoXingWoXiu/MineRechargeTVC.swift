//
//  MineRechargeTVC.swift
//  WoXingWoXiu
//
//  Created by 刘剑文 on 16/2/23.
//  Copyright © 2016年 kevinil. All rights reserved.
//

import UIKit

class MineRechargeTVC: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var rechargeText: UITextField!
    @IBOutlet weak var rechargeLabel: UILabel!
    
    @IBOutlet weak var zfbIV: UIImageView!
    @IBOutlet weak var wxIV: UIImageView!
    

    var textObserver : NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HiddenBackNavTitle(self)
        rechargeText.delegate = self
        observeText()
    }
    
    func observeText() {
        let queue = NSOperationQueue.mainQueue()
        let centet = NSNotificationCenter.defaultCenter()
        textObserver = centet.addObserverForName(UITextFieldTextDidChangeNotification, object: rechargeText, queue: queue){ (notification) -> Void in
            if let text = self.rechargeText.text {
                if !text.isEmpty {
                    if text[text.startIndex] == "0" {
                        self.rechargeText.text = ""
//                        self.rechargeLabel.text = "0"
                    }else {
                        self.rechargeText.text! += ".00"
                        self.rechargeLabel.text = "\(Int(Double(self.rechargeText.text!)!) * 100)"
                    }
                }
            }
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        print("string \(textField.text!)")
        print("\(string.isEmpty)")
        let nowLength = textField.text!.lengthOfBytesUsingEncoding(NSUnicodeStringEncoding)
        if nowLength == 8 && string.isEmpty {
            textField.text = ""
            rechargeLabel.text = "0"
        }else if !textField.text!.isEmpty {
            textField.text = "\(Int(Double(textField.text!)!))"
        }
        return true
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch Rows(rawValue: indexPath.row)! {
        case .Zhifubao :
            zfbIV.image = UIImage(named: "yes")
            wxIV.image = UIImage(named: "no")
        case .Weixin :
            zfbIV.image = UIImage(named: "no")
            wxIV.image = UIImage(named: "yes")
        }
    }
    
    private enum Rows : Int {
        case Zhifubao, Weixin
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 2 {
            return 80
        }else {
            return 20
        }
    }

}
