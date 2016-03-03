//
//  MineTVC.swift
//  WoXingWoXiu
//
//  Created by 刘剑文 on 16/2/22.
//  Copyright © 2016年 kevinil. All rights reserved.
//

import UIKit

class MineTVC: UITableViewController {

    @IBOutlet weak var mineCoverIV: UIImageView!
        { didSet {
            mineCoverIV.layer.cornerRadius = mineCoverIV.bounds.width / 2
            mineCoverIV.layer.masksToBounds = true
        } }
    @IBOutlet weak var chongzhiIV: UIImageView!
        { didSet {
            chongzhiIV.layer.cornerRadius = 5
            chongzhiIV.layer.masksToBounds = true
        } }
    @IBOutlet weak var tixianIV: UIImageView!
        { didSet {
            tixianIV.layer.cornerRadius = 5
            tixianIV.layer.masksToBounds = true
        } }
    @IBOutlet weak var shoucangIV: UIImageView!
        { didSet {
            shoucangIV.layer.cornerRadius = 5
            shoucangIV.layer.masksToBounds = true
        } }
    @IBOutlet weak var caifuIV: UIImageView!
        { didSet {
            caifuIV.layer.cornerRadius = 5
            caifuIV.layer.masksToBounds = true
        } }
    @IBOutlet weak var shezhiIV: UIImageView!
        { didSet {
            shezhiIV.layer.cornerRadius = 5
            shezhiIV.layer.masksToBounds = true
        } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navBar = self.navigationController?.navigationBar
        navBar?.barTintColor = Colors.red
        navBar?.tintColor = .whiteColor()
        navBar?.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        switch Sections(rawValue: indexPath.section)! {
        case .Profile : performSegueWithIdentifier("mineProfile", sender: nil)
        case .Account :
            switch AccountRows(rawValue: indexPath.row)! {
            case .Recharge : performSegueWithIdentifier("mineRecharge", sender: nil)
            case .WithDraw : performSegueWithIdentifier("mineWithDraw", sender: nil)
            }
        case .Treasure :
            switch TreasureRows(rawValue: indexPath.row)! {
            case .Favorite : performSegueWithIdentifier("mineFavorite", sender: nil)
            case .Fortune : performSegueWithIdentifier("mineFortune", sender: nil)
            }
        case .Setting :
            performSegueWithIdentifier("mineSetting", sender: nil)
        }
    }
    
    private enum Sections : Int {
        case Profile, Account, Treasure, Setting
    }
    
    private enum TreasureRows : Int {
        case Favorite, Fortune
    }
    
    private enum AccountRows : Int {
        case Recharge, WithDraw
    }

}
