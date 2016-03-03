//
//  MineProfileTVC.swift
//  WoXingWoXiu
//
//  Created by 刘剑文 on 16/2/23.
//  Copyright © 2016年 kevinil. All rights reserved.
//

import UIKit

class MineProfileTVC: UITableViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

//    let titles = ["昵称","个性签名","性别","年龄"]
    
    var coverAlert : UIAlertController?
    var quitAlert : UIAlertController?
    var portraitImagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let btn = creatButton(self, title: "退出登录", originY: 350)
        btn.addTarget(self, action: "alertQuit", forControlEvents: UIControlEvents.TouchUpInside)
        HiddenBackNavTitle(self)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Sections(rawValue: section)! {
        case .Info : return 3
        case .Property : return 3
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch Sections(rawValue: indexPath.section)! {
        case .Info :
            switch InfoRows(rawValue: indexPath.row)! {
            case .Profile :
                let cell = tableView.dequeueReusableCellWithIdentifier("coverCell", forIndexPath: indexPath)
                return cell
            case .Name :
                let cell = tableView.dequeueReusableCellWithIdentifier("nameCell", forIndexPath: indexPath) as! MineProfileCell
                cell.bodyLabel.text = "游悠"
                return cell
            case .Signature :
                let cell = tableView.dequeueReusableCellWithIdentifier("signatureCell", forIndexPath: indexPath) as! MineProfileCell
                cell.bodyLabel.text = "话很多被隐藏话很多被隐藏话很多被隐藏话很多被隐藏话很多被隐藏话很多被隐藏"
                return cell
            }
        case .Property :
            switch PropertyRows(rawValue: indexPath.row)! {
            case .Sex :
                let cell = tableView.dequeueReusableCellWithIdentifier("sexCell", forIndexPath: indexPath) as! MineProfileCell
                cell.bodyLabel.text = "男"
                return cell
            case .Age :
                let cell = tableView.dequeueReusableCellWithIdentifier("ageCell", forIndexPath: indexPath) as! MineProfileCell
                cell.bodyLabel.text = "24"
                return cell
            case .District :
                let cell = tableView.dequeueReusableCellWithIdentifier("districtCell", forIndexPath: indexPath) as! MineProfileCell
                cell.bodyLabel.text = "重庆"
                return cell
            }
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch Sections(rawValue: indexPath.section)! {
        case .Info :
            switch InfoRows(rawValue: indexPath.row)! {
            case .Profile : alertChangeCover()
            case .Name : performSegueWithIdentifier("editName", sender: nil)
            case .Signature : performSegueWithIdentifier("editSignature", sender: nil)
            }
        case .Property :
            switch PropertyRows(rawValue: indexPath.row)! {
            case .Sex : performSegueWithIdentifier("editSex", sender: nil)
            case .Age : performSegueWithIdentifier("editAge", sender: nil)
            case .District : performSegueWithIdentifier("editDistrict", sender: nil)
            }
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func prepareCamera(device : String) {
        if coverAlert == nil {
            coverAlert = UIAlertController(title: "", message: nil, preferredStyle: device == "phone" ? .ActionSheet : .Alert)
            addAlertAction(coverAlert!, title: "相册") { (alert) -> Void in
                if UIImagePickerController.isSourceTypeAvailable(.Camera) {
                    self.readyCamera(self.portraitImagePicker, category: "library")
                }
            }
            addAlertAction(coverAlert!, title: "启动相机"){ (alert) -> Void in
                if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary){
                    self.readyCamera(self.portraitImagePicker, category: "camera")
                    self.portraitImagePicker.showsCameraControls = true
                }
            }
            addRedAlertAction(coverAlert!, title: "取消", handler: nil)
            presentViewController(coverAlert!, animated: true, completion: nil)
        }else {
            presentViewController(coverAlert!, animated: true, completion: nil)
        }
    }
    
    func prepareQuit(device : String) {
        if quitAlert == nil {
            quitAlert = UIAlertController(title: "", message: nil, preferredStyle: device == "phone" ? .ActionSheet : .Alert)
            addAlertAction(quitAlert!, title: "确认退出") { (alert) -> Void in
            }
            addRedAlertAction(quitAlert!, title: "取消", handler: nil)
            presentViewController(quitAlert!, animated: true, completion: nil)
        }else {
            presentViewController(quitAlert!, animated: true, completion: nil)
        }
    }
    
    func readyCamera(picker : UIImagePickerController, category : String) {
        picker.showsCameraControls = true
        picker.sourceType = category == "camera" ? .Camera : .PhotoLibrary
//        picker.mediaTypes = [kUTTypeImage as String]
        picker.delegate = self
        picker.allowsEditing = true
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    func alertChangeCover() {
        switch UIDevice.currentDevice().userInterfaceIdiom {
        case .Phone:
            prepareCamera("phone")
        case .Pad :
            prepareCamera("pad")
        default:return
        }
    }
    
    func alertQuit() {
        switch UIDevice.currentDevice().userInterfaceIdiom {
        case .Phone:
            prepareQuit("phone")
        case .Pad :
            prepareQuit("pad")
        default:return
        }
    }
    
    private enum Sections : Int {
        case Info, Property
    }
    
    private enum InfoRows : Int {
        case Profile, Name, Signature
    }
    
    private enum PropertyRows : Int {
        case Sex, Age, District
    }

}
