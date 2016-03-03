//
//  SignatureTVC.swift
//  WoXingWoXiu
//
//  Created by 刘剑文 on 16/2/23.
//  Copyright © 2016年 kevinil. All rights reserved.
//

import UIKit

class SignatureTVC: UITableViewController, UITextViewDelegate {

    @IBOutlet weak var signatureText: UITextView!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBAction func done(sender: AnyObject) {
        view.endEditing(true)
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HiddenBackNavTitle(self)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }

}
