//
//  StoreCell.swift
//  WoXingWoXiu
//
//  Created by 刘剑文 on 16/2/24.
//  Copyright © 2016年 kevinil. All rights reserved.
//

import UIKit

class StoreCell: UICollectionViewCell {
    
    @IBOutlet weak var giftButton: UIButton! {
        didSet {
            giftButton.layer.cornerRadius = 10
            giftButton.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var buyButton: UIButton! {
        didSet {
            buyButton.layer.cornerRadius = 10
            buyButton.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var coverIV: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
}
