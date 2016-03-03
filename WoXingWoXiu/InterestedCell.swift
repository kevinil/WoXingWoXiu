//
//  InterestedCell.swift
//  WoXingWoXiu
//
//  Created by 刘剑文 on 16/2/24.
//  Copyright © 2016年 kevinil. All rights reserved.
//

import UIKit

class InterestedCell: UITableViewCell {
    
    var titleLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel = UILabel(frame: CGRectMake(15, 12, 100, 20))
        titleLabel.font = UIFont.systemFontOfSize(17)
        contentView.addSubview(titleLabel)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
