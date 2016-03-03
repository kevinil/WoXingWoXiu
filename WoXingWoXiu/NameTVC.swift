//
//  NameTVC.swift
//  WoXingWoXiu
//
//  Created by 刘剑文 on 16/2/23.
//  Copyright © 2016年 kevinil. All rights reserved.
//

import UIKit

class NameTVC: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var nameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HiddenBackNavTitle(self)
        nameText.delegate = self
        let btn = creatButton(self, title: "确定", originY: 100)
        btn.addTarget(self, action: "checkDone", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func checkDone() {
        print("111")
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }

}
