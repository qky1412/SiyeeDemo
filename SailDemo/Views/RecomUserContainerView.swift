//
//  RecomUserContainerView.swift
//  SailDemo
//
//  Created by qky on 14/12/21.
//  Copyright (c) 2014年 sail. All rights reserved.
//

import UIKit

class RecomUserContainerView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    var view: UIView!
    let cellId = "RecomUserCollectionViewCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    override init(frame: CGRect) {
        // 1. setup any properties here
        
        // 2. call super.init(frame:)
        super.init(frame: frame)
        
        // 3. Setup view from .xib file
    }
    required init(coder aDecoder: NSCoder) {
        // 1. setup any properties here
        
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        
        // 3. Setup view from .xib file
        
    }

    override func awakeFromNib() {
        var nib = UINib(nibName:"RecomUserCollectionViewCell", bundle: nil)
        
        collectionView.registerNib(nib, forCellWithReuseIdentifier: cellId)
        //collectionView.backgroundColor = UIColor.purpleColor()
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as RecomUserCollectionViewCell
        cell.profile.image = UIImage(named: "profile\(indexPath.row + 1).png")
        return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println(self.view.window?.inputViewController?.description)
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        
    }
    func setCollectionViewDataSourceDelegate(dataSourceDelegate delegate: protocol<UICollectionViewDelegate,UICollectionViewDataSource>, index: NSInteger) {
        self.collectionView.dataSource = delegate
        self.collectionView.delegate = delegate
        self.collectionView.tag = index
        self.collectionView.reloadData()
    }

}
