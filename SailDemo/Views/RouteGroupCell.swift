//
//  RouteGroupCell.swift
//  SailDemo
//
//  Created by qky on 15/1/19.
//  Copyright (c) 2015年 sail. All rights reserved.
//

import UIKit

class RouteGroupCell: UICollectionViewCell {
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupDescription: UILabel!
    @IBOutlet weak var groupLeader: UILabel!
    @IBOutlet weak var leaderProfile: UIImageView!
    @IBOutlet weak var groupPeople: UILabel!
    @IBOutlet weak var groupTimeLeft: UILabel!

    @IBOutlet weak var back: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.back.layer.borderWidth = 0.5
        self.back.layer.borderColor = UIColor(netHex:0xbebebe).CGColor
    }

}
