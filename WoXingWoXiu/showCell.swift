//
//  showCell.swift
//  WoXingWoXiu
//
//  Created by 刘剑文 on 16/2/23.
//  Copyright © 2016年 kevinil. All rights reserved.
//

import UIKit

class showCell: UICollectionViewCell {
    
    @IBOutlet weak var arcView: UIView! {
        didSet {
            arcView.layer.cornerRadius = arcView.bounds.width / 2
            arcView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var gradientView: GradientView!
    @IBOutlet weak var coverIV: UIImageView! {
        didSet {
            coverIV.layer.cornerRadius = coverIV.bounds.width / 2
            coverIV.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    
    
}
