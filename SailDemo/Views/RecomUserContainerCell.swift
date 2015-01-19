//
//  RecomUserTableViewCell.swift
//  SailDemo
//
//  Created by qky on 14/12/20.
//  Copyright (c) 2014年 sail. All rights reserved.
//

import UIKit
import Foundation

class RecomUserContainerCell: UIView, UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet weak var collectionView: UICollectionView!
    var cellId = "RecomUserCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        var nib = UINib(nibName:"RecomUserCollectionViewCell", bundle: nil)
        
        collectionView.registerNib(nib, forCellWithReuseIdentifier: cellId)

    }

    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as RecomUserCollectionViewCell
        return cell
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
}
