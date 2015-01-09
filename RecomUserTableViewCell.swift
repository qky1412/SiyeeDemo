//
//  RecomUserTableViewCell.swift
//  SailDemo
//
//  Created by qky on 14/12/21.
//  Copyright (c) 2014年 sail. All rights reserved.
//

import UIKit

class RecomUserTableViewCell: UITableViewCell {
    var containerView:RecomUserContainerView!
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.containerView = RecomUserTableViewCell.instanceFromNib()
        //self.containerView.backgroundColor = UIColor.redColor()
        self.contentView.addSubview(self.containerView)
        
    }
    class func instanceFromNib() -> RecomUserContainerView {
        return UINib(nibName: "RecomUserContainerView", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as RecomUserContainerView
    }
    required init(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

    
}
