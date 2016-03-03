//
//  MineFortuneVC.swift
//  WoXingWoXiu
//
//  Created by 刘剑文 on 16/2/23.
//  Copyright © 2016年 kevinil. All rights reserved.
//

import UIKit
import MJRefresh

class MineFortuneVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var eachTableView: UITableView!
    
    let tempData = [["category":"set","date":"2011-11-11 11:11:11","amount":"3000"],
                    ["category":"get","date":"2011-11-11 11:11:22","amount":"233"],
                    ["category":"set","date":"2016-2-13 23:33:33","amount":"666"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HiddenBackNavTitle(self)
        self.tabBarController?.tabBar.hidden = true
        eachTableView.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: { () -> Void in
            
        })
        eachTableView.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: "loadMoreEach")
    }
  
    
    func loadMoreEach() {
        print("moreEach")
        eachTableView.mj_footer.endRefreshingWithNoMoreData()
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "交易记录"
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("eachCell", forIndexPath: indexPath) as! MineFortuneEachCell
        let text = tempData[indexPath.row]["category"]
        let thisSet = text == "set"
        cell.categoryLabel.text = thisSet ? "充值" : "提现"
            cell.dateLabel.text = tempData[indexPath.row]["date"]
        cell.amountLabel.text = (thisSet ? "+" : "-") + tempData[indexPath.row]["amount"]!
        cell.amountLabel.textColor = thisSet ? Colors.green : Colors.red
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.separatorInset = UIEdgeInsetsZero
        cell.preservesSuperviewLayoutMargins = false
        cell.layoutMargins = UIEdgeInsetsZero
    }
}


