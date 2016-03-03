//
//  MineProfileCell.swift
//  WoXingWoXiu
//
//  Created by 刘剑文 on 16/2/23.
//  Copyright © 2016年 kevinil. All rights reserved.
//

import UIKit

class MineProfileCell: UITableViewCell {

    @IBOutlet weak var coverIV: UIImageView! {
        didSet {
            coverIV.layer.cornerRadius = coverIV.bounds.width / 2
            coverIV.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    


}
