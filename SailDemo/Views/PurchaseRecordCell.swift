//
//  PayListCell.swift
//  SailDemo
//
//  Created by qky on 15/1/21.
//  Copyright (c) 2015年 sail. All rights reserved.
//

import UIKit

class PurchaseRecordCell: UITableViewCell {

    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var route: UILabel!
    @IBOutlet weak var people: UILabel!
    @IBOutlet weak var time: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
