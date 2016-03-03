//
//  showCVC.swift
//  WoXingWoXiu
//
//  Created by 刘剑文 on 16/2/23.
//  Copyright © 2016年 kevinil. All rights reserved.
//

import UIKit


class showCVC: UICollectionViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var selectBarBtn: UIBarButtonItem!

    @IBAction func selectInterested(sender: AnyObject) {
        hiddenBool = !hiddenBool
        if hiddenBool {
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                
                self.interestedTableView.alpha = 0
                }) { (finish) -> Void in
                    self.interestedTableView.hidden = true
            }
        }else {
            UIView.animateWithDuration(0.5) { () -> Void in
                self.interestedTableView.hidden = false
                self.interestedTableView.alpha = 1
            }
        }
        
    }
    
    var interestedTableView : UITableView!
    var hiddenBool = true
    
    
    var rectSize : CGFloat!
    var newTap : UITapGestureRecognizer!
    var hotTap : UITapGestureRecognizer!
    var newLabel : UILabel!
    var hotLabel : UILabel!
    var lineView : UIView!
    var newFrame : CGRect!
    var hotFrame : CGRect!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSize()
        createButtons()
        createInterestedTableView()
        let navBar = self.navigationController?.navigationBar
        navBar?.barTintColor = Colors.red
//        navBar?.tintColor = .whiteColor()
//        navBar?.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
    }
    
    func setupSize() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        rectSize = view.bounds.width / 2
        layout.itemSize = CGSizeMake(rectSize, rectSize)
        collectionView!.collectionViewLayout = layout
    }
    
    func createButtons() {
        newFrame = CGRectMake(view.bounds.width / 2 - 70, 36, 70, 2)
        hotFrame = CGRectMake(view.bounds.width / 2, 36, 70, 2)
        lineView = UIView(frame: newFrame)
        lineView.backgroundColor = UIColor.whiteColor()
        navigationController?.navigationBar.addSubview(lineView)
        newTap = UITapGestureRecognizer(target: self, action: "newPage")
        hotTap = UITapGestureRecognizer(target: self, action: "hotPage")
        newLabel = UILabel(frame: CGRectMake(view.bounds.width / 2 - 70, 0, 70, 35))
        newLabel.text = "最新"
        newLabel.textColor = UIColor.whiteColor()
        newLabel.textAlignment = .Center
        newLabel.userInteractionEnabled = true
        newLabel.addGestureRecognizer(newTap)
        navigationController?.navigationBar.addSubview(newLabel)
        hotLabel = UILabel(frame: CGRectMake(view.bounds.width / 2, 0, 70, 35))
        hotLabel.text = "最热"
        hotLabel.textAlignment = .Center
        hotLabel.userInteractionEnabled = true
        hotLabel.addGestureRecognizer(hotTap)
        navigationController?.navigationBar.addSubview(hotLabel)
    }
    
    func createInterestedTableView() {
        interestedTableView = UITableView(frame: CGRectMake(0, 64, view.bounds.width, 88))
        interestedTableView.delegate = self
        interestedTableView.dataSource = self
        interestedTableView.registerClass(InterestedCell.self, forCellReuseIdentifier: "interestedCell")
        interestedTableView.alpha = 0
        interestedTableView.hidden = true
        interestedTableView.scrollEnabled = false
        view.addSubview(interestedTableView)
    }
    
    func newPage() {
        print("new")
        newLabel.textColor = UIColor.whiteColor()
        hotLabel.textColor = UIColor.blackColor()
        UIView.animateWithDuration(0.1) { () -> Void in
            self.lineView.frame = self.newFrame
        }
    }
    
    func hotPage() {
        print("hot")
        newLabel.textColor = UIColor.blackColor()
        hotLabel.textColor = UIColor.whiteColor()
        UIView.animateWithDuration(0.1) { () -> Void in
            self.lineView.frame = self.hotFrame
        }
    }
    
    // MARK: Table View
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch TableViewRows(rawValue: indexPath.row)! {
        case .Man :
            let cell = tableView.dequeueReusableCellWithIdentifier("interestedCell", forIndexPath: indexPath) as! InterestedCell
//            cell.titleLabel.text = "只看男"
            return cell
        case .Woman :
            let cell = tableView.dequeueReusableCellWithIdentifier("interestedCell", forIndexPath: indexPath) as! InterestedCell
//            cell.titleLabel.text = "只看女"
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        switch TableViewRows(rawValue: indexPath.row)! {
        case .Man :
            print("man")
        case .Woman :
            print("woman")
        }
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.interestedTableView.alpha = 0
            }) { (finish) -> Void in
                self.interestedTableView.hidden = true
        }
        hiddenBool = true
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("showCell", forIndexPath: indexPath) as! showCell
    
        return cell
    }
    
    private enum TableViewRows : Int {
        case Man, Woman
    }

}
