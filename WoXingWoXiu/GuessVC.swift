//
//  GuessVC.swift
//  WoXingWoXiu
//
//  Created by 刘剑文 on 16/2/24.
//  Copyright © 2016年 kevinil. All rights reserved.
//

import UIKit

class GuessVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        HiddenBackNavTitle(self)
        tabBarController?.tabBar.hidden = true
        
    }

}
