//
//  DistrictTVC.swift
//  WoXingWoXiu
//
//  Created by 刘剑文 on 16/2/23.
//  Copyright © 2016年 kevinil. All rights reserved.
//

import UIKit

class DistrictTVC: UITableViewController {

    @IBOutlet weak var districtLabel: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    let districts = ["重庆","北京","上海"]
    var pickHeight : CGFloat = 0
    var initial = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.hidden = initial
    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        pickDistrict()
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
    
    func pickDistrict() {
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
        return districts.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return districts[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        districtLabel.text = districts[row]
    }
    
    
    
    private enum TableRows : Int {
        case Show, Pick
    }
    

}
