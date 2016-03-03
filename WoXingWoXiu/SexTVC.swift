//
//  SexTVC.swift
//  WoXingWoXiu
//
//  Created by 刘剑文 on 16/2/23.
//  Copyright © 2016年 kevinil. All rights reserved.
//

import UIKit

class SexTVC: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {


    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var sexLabel: UILabel!
    
    let sexs = ["男","女"]
    var pickHeight : CGFloat = 0
    var initial = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.hidden = initial
//        createSexPicker()
    }
    
//    func createSexPicker() {
//        let containView = UIView(frame: CGRectMake(0, view.bounds.height - 150, view.bounds.width, 150))
//        pickerView = UIPickerView(frame: CGRectMake(15, 45, view.bounds.width - 30, 50))
//        pickerView.delegate = self
//        containView.addSubview(pickerView)
//        view.addSubview(containView)
//    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        pickSex()
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch TableRows(rawValue: indexPath.row)! {
        case .Show : return 44
        case .Pick : return pickHeight
        }
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.separatorInset = UIEdgeInsetsZero
        cell.preservesSuperviewLayoutMargins = false
        cell.layoutMargins = UIEdgeInsetsZero
    }
    
    func pickSex() {
        pickHeight = initial ? 150 : 0
        UIView.transitionWithView(tableView, duration: 0.3, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
            self.initial = !self.initial
            self.pickerView.hidden = self.initial
            self.tableView.reloadData()
            }) { (finish) -> Void in
                //
        }
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sexs[row]
//        switch PickerRows(rawValue: row)! {
//        case .Man : return "男"
//        case .Woman : return "女"
//        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sexLabel.text = sexs[row]
    }
    
    
    
    private enum TableRows : Int {
        case Show, Pick
    }
    
    private enum PickerRows : Int {
        case Man, Woman
    }

}
