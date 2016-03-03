//
//  RankingsCell.swift
//  WoXingWoXiu
//
//  Created by 刘剑文 on 16/2/24.
//  Copyright © 2016年 kevinil. All rights reserved.
//

import UIKit

class RankingsCell: UITableViewCell {

    
    @IBOutlet weak var rankIV: UIImageView!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var coverIV: UIImageView! {
        didSet {
            coverIV.layer.cornerRadius = coverIV.bounds.width / 2
            coverIV.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countIV: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    

}
