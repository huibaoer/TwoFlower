//
//  CityCell.swift
//  TwoFlowerSelection
//
//  Created by zhanght on 16/6/30.
//  Copyright © 2016年 zhanght. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {
    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
       
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cellHeight() -> CGFloat {
        return UIScreen.mainScreen().bounds.size.width*200/320 + 75
    }
    
}
