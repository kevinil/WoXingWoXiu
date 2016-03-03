//
//  MineSettingTVC.swift
//  WoXingWoXiu
//
//  Created by 刘剑文 on 16/2/22.
//  Copyright © 2016年 kevinil. All rights reserved.
//

import UIKit

class MineSettingTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        HiddenBackNavTitle(self)
        self.tabBarController?.tabBar.hidden = true
    }
}
