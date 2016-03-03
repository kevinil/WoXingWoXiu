//
//  MineWithDrawTVC.swift
//  WoXingWoXiu
//
//  Created by 刘剑文 on 16/2/23.
//  Copyright © 2016年 kevinil. All rights reserved.
//

import UIKit

class MineWithDrawTVC: UITableViewController {

    @IBOutlet weak var withDrawText: UITextField!
    @IBOutlet weak var withDrawLabel: UILabel!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var idText: UITextField!
    @IBOutlet weak var cardText: UITextField!
    
    var textObserver : NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HiddenBackNavTitle(self)
        oberveText()
    }
    
    func oberveText() {
        let queue = NSOperationQueue.mainQueue()
        let center = NSNotificationCenter.defaultCenter()
        textObserver = center.addObserverForName(UITextFieldTextDidChangeNotification, object: withDrawText, queue: queue) { (notification) -> Void in
            if let text = self.withDrawText.text {
                if !text.isEmpty {
                    if text[text.startIndex] == "0" {
                        self.withDrawText.text = ""
                    }else {
                        //账户余额
                    }
                }
            }
        }
    }

}
