//
//  RankingsVC.swift
//  WoXingWoXiu
//
//  Created by 刘剑文 on 16/2/24.
//  Copyright © 2016年 kevinil. All rights reserved.
//

import UIKit
import MJRefresh

class RankingsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var slideLine: UIView!
    @IBOutlet weak var fortuneLabel: UILabel!
    @IBOutlet weak var consumeLabel: UILabel!
    @IBOutlet weak var fansLabel: UILabel!
    
    @IBOutlet weak var rankingsTableView: UITableView!
    var fortuneTap : UITapGestureRecognizer!
    var consumeTap : UITapGestureRecognizer!
    var fansTap : UITapGestureRecognizer!
    
    var fortuneFrame : CGRect!
    var consumeFrame : CGRect!
    var fansFrame : CGRect!
    var rankFrames = [CGRect]()
    var rank = RankState.Fortune
    
    var fortuneFour = [["name":"Kevinil","image":"mineCover","content":"443312"],
        ["name":"someone","image":"back","content":"123121"],
        ["name":"nobody","image":"mineCover","content":"13232"],
        ["name":"thisguy","image":"back","content":"2222"],
        ["name":"第五名","image":"back","content":"333"]]
    var consumeFour = [["name":"Kevinil","image":"mineCover","content":"443312"],
        ["name":"someone","image":"back","content":"123121"],
        ["name":"nobody","image":"mineCover","content":"13232"],
        ["name":"thisguy","image":"back","content":"2222"],
        ["name":"第五名","image":"back","content":"333"]]
    var fansFour = [["name":"Kevinil","image":"mineCover","content":"443312"],
        ["name":"someone","image":"back","content":"123121"],
        ["name":"nobody","image":"mineCover","content":"13232"],
        ["name":"thisguy","image":"back","content":"2222"],
        ["name":"第五名","image":"back","content":"333"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HiddenBackNavTitle(self)
        tabBarController?.tabBar.hidden = true
        setupFrames()
        setupTaps()
        rankingsTableView.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: { () -> Void in
            
        })
        rankingsTableView.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: "loadMoreEach")
    }
    
    
    func loadMoreEach() {
        print("moreEach")
        rankingsTableView.mj_footer.endRefreshingWithNoMoreData()
    }

    func setupFrames() {
        fortuneFrame = CGRectMake(0, 49, view.bounds.width / 3, 2)
        consumeFrame = CGRectMake(view.bounds.width * 1 / 3, 49, view.bounds.width / 3, 2)
        fansFrame = CGRectMake(view.bounds.width * 2 / 3, 49, view.bounds.width / 3, 2)
        slideLine.frame = fortuneFrame
        rankFrames.append(fortuneFrame)
        rankFrames.append(consumeFrame)
        rankFrames.append(fansFrame)
    }
    
    func setupTaps() {
        fortuneTap = UITapGestureRecognizer(target: self, action: "coFortune")
        fortuneLabel.addGestureRecognizer(fortuneTap)
        consumeTap = UITapGestureRecognizer(target: self, action: "coConsume")
        consumeLabel.addGestureRecognizer(consumeTap)
        fansTap = UITapGestureRecognizer(target: self, action: "coFans")
        fansLabel.addGestureRecognizer(fansTap)
    }
    
    func coFortune() {
        slideAnimation(.Fortune)
        rank = .Fortune
        rankingsTableView.reloadData()
    }
    
    func coConsume() {
        slideAnimation(.Consume)
        rank = .Consume
        rankingsTableView.reloadData()
    }
    
    func coFans() {
        slideAnimation(.Fans)
        rank = .Fans
        rankingsTableView.reloadData()
    }
    
    func slideAnimation(state: RankState) {
        fortuneLabel.textColor = .darkGrayColor()
        consumeLabel.textColor = .darkGrayColor()
        fansLabel.textColor = .darkGrayColor()
        switch state {
        case .Fortune : fortuneLabel.textColor = Colors.red
        case .Consume : consumeLabel.textColor = Colors.red
        case .Fans : fansLabel.textColor = Colors.red
        }
        UIView.animateWithDuration(0.2) { () -> Void in
            self.slideLine.frame = self.rankFrames[state.rawValue]
        }
    }
    
    // MARK: Table View
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch rank {
        case .Fortune :
            let cell = tableView.dequeueReusableCellWithIdentifier("rankCell", forIndexPath: indexPath) as! RankingsCell
            if indexPath.row == 0 {
                cell.rankIV.image = UIImage(named: "first")
            }else if indexPath.row == 1 {
                cell.rankIV.image = UIImage(named: "second")
            }else if indexPath.row == 2 {
                cell.rankIV.image = UIImage(named: "third")
            }else {
                cell.rankLabel.text = "\(indexPath.row)"
            }
            cell.coverIV.image = UIImage(named: fortuneFour[indexPath.row]["image"]!)
            cell.nameLabel.text = fortuneFour[indexPath.row]["name"]
            cell.countIV.image = UIImage(named: "fortune")
            cell.countLabel.text = fortuneFour[indexPath.row]["content"]
            cell.countLabel.textColor = Colors.red
            return cell
        case .Consume :
            let cell = tableView.dequeueReusableCellWithIdentifier("rankCell", forIndexPath: indexPath) as! RankingsCell
            if indexPath.row == 0 {
                cell.rankIV.image = UIImage(named: "first")
            }else if indexPath.row == 1 {
                cell.rankIV.image = UIImage(named: "second")
            }else if indexPath.row == 2 {
                cell.rankIV.image = UIImage(named: "third")
            }else {
                cell.rankLabel.text = "\(indexPath.row)"
            }
            cell.coverIV.image = UIImage(named: fortuneFour[indexPath.row]["image"]!)
            cell.nameLabel.text = fortuneFour[indexPath.row]["name"]
            cell.countIV.image = UIImage(named: "consume")
            cell.countLabel.text = fortuneFour[indexPath.row]["content"]
            cell.countLabel.textColor = Colors.red
            return cell
        case .Fans :
            let cell = tableView.dequeueReusableCellWithIdentifier("rankCell", forIndexPath: indexPath) as! RankingsCell
            if indexPath.row == 0 {
                cell.rankIV.image = UIImage(named: "first")
            }else if indexPath.row == 1 {
                cell.rankIV.image = UIImage(named: "second")
            }else if indexPath.row == 2 {
                cell.rankIV.image = UIImage(named: "third")
            }else {
                cell.rankLabel.text = "\(indexPath.row)"
            }
            cell.coverIV.image = UIImage(named: fortuneFour[indexPath.row]["image"]!)
            cell.nameLabel.text = fortuneFour[indexPath.row]["name"]
            cell.countIV.image = UIImage(named: "fans")
            cell.countLabel.text = fortuneFour[indexPath.row]["content"]
            cell.countLabel.textColor = Colors.blue
            return cell
        }
    }
    
    enum RankState : Int {
        case Fortune, Consume, Fans
    }
    
    enum Rows : Int {
        case First, Second, Third
    }
}
