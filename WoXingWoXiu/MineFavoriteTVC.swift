//
//  MineFavoriteTVC.swift
//  WoXingWoXiu
//
//  Created by 刘剑文 on 16/2/23.
//  Copyright © 2016年 kevinil. All rights reserved.
//

import UIKit

class MineFavoriteTVC: UITableViewController {

    var tempData = [["name":"Kevinil", "date":"2016-2-1 20:11:11","content":"视频","iv":"shipin"],
                    ["name":"Jacom", "date":"2016-2-13 22:13:22","content":"神马广告","iv":"guanggao"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.hidden = true
  
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return tempData.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("favoriteCell", forIndexPath: indexPath) as! MineFavoriteCell
        cell.nameLabel.text = tempData[indexPath.section]["name"]
        cell.dateLabel.text = tempData[indexPath.section]["date"]
        cell.contentLabel.text = tempData[indexPath.section]["content"]
        cell.contentIV.image = UIImage(named: tempData[indexPath.section]["iv"]!)
        return cell
    }
    

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 170
    }
    

}
