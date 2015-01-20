//
//  DiscoveryTableViewCell.swift
//  SailDemo
//
//  Created by qky on 15/1/6.
//  Copyright (c) 2015年 sail. All rights reserved.
//

import UIKit

class DiscoveryTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    let cellId = "DiscoveryCollectionCell"
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var signature: UILabel!
    @IBOutlet weak var follow: UIImageView!
    @IBOutlet weak var photo1: UIImageView!
    @IBOutlet weak var photo2: UIImageView!
    @IBOutlet weak var photo3: UIImageView!
    @IBOutlet weak var photo4: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var back: UIView!
    var coverView:UIView!
    var photos = [String]()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        var nib = UINib(nibName:"DiscoveryCollectionViewCell", bundle: nil)
        self.back.layer.borderWidth = 0.5
        self.back.layer.borderColor = UIColor(netHex:0xbebebe).CGColor
        collectionView.registerNib(nib, forCellWithReuseIdentifier: cellId)
        
    }
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        if(highlighted){
            
            self.back.backgroundColor = UIColor.lightTextColor()
            
        }else{
            self.back.backgroundColor = UIColor.whiteColor()
        }
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
        // Configure the view for the selected state
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return photos.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as DiscoveryCollectionViewCell
        cell.photo.image = UIImage(named: photos[indexPath.row])
        return cell
    }
}
