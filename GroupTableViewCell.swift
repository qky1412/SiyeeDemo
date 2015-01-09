//
//  GroupTableViewCell.swift
//  SailDemo
//
//  Created by qky on 14/12/30.
//  Copyright (c) 2014年 sail. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    @IBOutlet weak var cover: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var departure: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var back: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.back.layer.borderWidth = 0.5
        self.back.layer.borderColor = UIColor(netHex:0xbebebe).CGColor
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
