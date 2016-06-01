//
//  MainListCell.swift
//  TwoFlowerSelection
//
//  Created by zhanght on 16/6/1.
//  Copyright © 2016年 zhanght. All rights reserved.
//

import UIKit

class MainListCell: UITableViewCell {
    
    @IBOutlet weak var goodsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var recommendLabel: UILabel!
    
    class func cellHeight() -> CGFloat {
        return 95.0;
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        recommendLabel.layer.cornerRadius = 2.0
        recommendLabel.layer.masksToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
