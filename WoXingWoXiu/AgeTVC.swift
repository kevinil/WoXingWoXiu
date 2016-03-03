//
//  AgeTVC.swift
//  WoXingWoXiu
//
//  Created by 刘剑文 on 16/2/23.
//  Copyright © 2016年 kevinil. All rights reserved.
//

import UIKit

class AgeTVC: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var ageText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ageText.delegate = self
        HiddenBackNavTitle(self)
        let btn = creatButton(self, title: "确定", originY: 100)
        btn.addTarget(self, action: "checkDone", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    func checkDone() {
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }

}
