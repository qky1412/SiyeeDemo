//
//  RecomRouteTableViewCell.swift
//  SailDemo
//
//  Created by qky on 14/12/18.
//  Copyright (c) 2014年 sail. All rights reserved.
//

import UIKit

class RecomRouteTableViewCell: UITableViewCell {

    @IBOutlet weak var sampleCover: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.sampleCover.layer.cornerRadius = 5
        self.sampleCover.layer.masksToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
