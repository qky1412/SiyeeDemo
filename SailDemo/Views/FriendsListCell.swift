//
//  FollowersListCell.swift
//  SailDemo
//
//  Created by qky on 15/1/21.
//  Copyright (c) 2015年 sail. All rights reserved.
//

import UIKit

class FriendsListCell: UITableViewCell {

    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var signature: UILabel!
    @IBOutlet weak var followButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
