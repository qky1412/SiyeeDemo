//
//  GroupHistoryCell.swift
//  SailDemo
//
//  Created by qky on 15/1/21.
//  Copyright (c) 2015年 sail. All rights reserved.
//

import UIKit

class GroupRecordCell: UITableViewCell {
    @IBOutlet weak var groupName: UILabel!

    @IBOutlet weak var groupPeople: UILabel!
    @IBOutlet weak var groupRoute: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
