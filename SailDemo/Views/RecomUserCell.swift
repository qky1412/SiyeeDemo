//
//  RecomUserCell.swift
//  SailDemo
//
//  Created by qky on 15/1/23.
//  Copyright (c) 2015年 sail. All rights reserved.
//

import UIKit

class RecomUserCell: UITableViewCell {
    let cellId = "RecomUserCollectionViewCell"
    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        var cellNib = UINib(nibName: "RecomUserCollectionViewCell", bundle: nil)
        collectionView.registerNib(cellNib, forCellWithReuseIdentifier: cellId)
//        collectionView.registerClass(RecomUserCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: cellId)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCollectionViewDataSourceDelegate(dataSourceDelegate delegate: protocol<UICollectionViewDelegate,UICollectionViewDataSource>) {
        self.collectionView.dataSource = delegate
        self.collectionView.delegate = delegate
        self.collectionView.reloadData()
    }
}
