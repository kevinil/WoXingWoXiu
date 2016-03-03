//
//  GoldVC.swift
//  WoXingWoXiu
//
//  Created by 刘剑文 on 16/2/24.
//  Copyright © 2016年 kevinil. All rights reserved.
//

import UIKit

class GoldVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {

    
    @IBOutlet weak var showTV: UITableView!
    
    var topSV: UIScrollView!
    var topPageView : UIImageView!
    var swipeGesture : UISwipeGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.hidden = true
        HiddenBackNavTitle(self)
        setupTopSVImage()
        showTV.estimatedRowHeight = showTV.rowHeight
        showTV.rowHeight = UITableViewAutomaticDimension
        let iv = UIImageView(image: UIImage(named: "mineCover"))
        iv.frame = CGRectMake(14, 36, 106, 106)
        showTV.addSubview(iv)
    }
    
    func setupTopSVImage() {
//        let label = UILabel(frame: CGRectMake(100,100,100,100))
//        label.text = "1dajsgdjashdjkahsd"
//        view.addSubview(label)
        
        let viewWidth = view.bounds.width + 8
        let viewHeight = view.bounds.height
        topSV = UIScrollView(frame: CGRectMake(0, 64, viewWidth, viewHeight / 3))
        topSV.contentSize = CGSizeMake(viewWidth * 3, viewHeight / 3)
        topSV.pagingEnabled = true
        topSV.delegate = self
        for index in 0..<3 {
            let iv = UIImageView(image: UIImage(named: "mineCover"))
            iv.frame = CGRectMake(CGFloat(index) * viewWidth, 0, viewWidth, viewHeight / 3)
            topSV.addSubview(iv)
        }
        topSV.showsHorizontalScrollIndicator = false
        topSV.bounces = false
        view.addSubview(topSV)
//        wholeView.addSubview(topSV)
        swipeGesture = UISwipeGestureRecognizer(target: self, action: "handleSwipe")
        swipeGesture.delegate = self
        
        topPageView = UIImageView(image: UIImage(named: "back"))
        topPageView.frame = CGRectMake(viewWidth / 2 - 30, viewHeight / 3 + 4, 60, 40)
        view.addSubview(topPageView)
//        wholeView.addSubview(topPageView)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Sections(rawValue: section)! {
        case .Goods : return 3
        case .Info : return 4
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch Sections(rawValue: indexPath.section)! {
        case .Goods :
            switch GoodsRows(rawValue: indexPath.row)! {
            case .Name :
                let cell = tableView.dequeueReusableCellWithIdentifier("goodsCell", forIndexPath: indexPath)
                return cell
            case .Price :
                let cell = tableView.dequeueReusableCellWithIdentifier("goodsCell", forIndexPath: indexPath)
                return cell
            case .Gold :
                let cell = tableView.dequeueReusableCellWithIdentifier("goodsCell", forIndexPath: indexPath)
                return cell
                
            }
        case.Info :
            switch InfoRows(rawValue: indexPath.row)! {
            case .Owner :
                let cell = tableView.dequeueReusableCellWithIdentifier("infoCell", forIndexPath: indexPath)
                return cell
            case .Address :
                let cell = tableView.dequeueReusableCellWithIdentifier("infoCell", forIndexPath: indexPath)
                return cell
            case .Phone :
                let cell = tableView.dequeueReusableCellWithIdentifier("infoCell", forIndexPath: indexPath)
                return cell
            case .Barcode :
                let cell = tableView.dequeueReusableCellWithIdentifier("barcodeCell", forIndexPath: indexPath)
                return cell
            }
        }
        
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.section {
        case 0:
            cell.separatorInset = UIEdgeInsetsZero
            cell.preservesSuperviewLayoutMargins = false
            cell.layoutMargins = UIEdgeInsetsMake(0, 140, 0, 0)
        default : return
        }
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 22
        }else {
            return 1
        }
    }

    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

        view.frame = CGRectMake(0, 0, view.bounds.width, 1)
    }

    private enum Sections : Int {
        case Goods, Info
    }
    
    private enum GoodsRows : Int {
        case Name, Price, Gold
    }
    
    private enum InfoRows : Int {
        case Owner, Address, Phone, Barcode
    }

}
