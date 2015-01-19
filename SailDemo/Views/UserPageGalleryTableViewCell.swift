//
//  UserPageGalleryTableViewCell.swift
//  SailDemo
//
//  Created by qky on 15/1/13.
//  Copyright (c) 2015年 sail. All rights reserved.
//

import UIKit

class UserPageGalleryTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    var photos = ["user11", "user12", "user13", "user14", "user21", "user22", "user23", "user24", "user31", "user32", "user33", "user34", "user41", "user42", "user43", "user44"]
    let cellId = "PhotoBrowserCollectionViewCell"
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupViews()
    }
    func setupViews(){
        
        collectionView.registerClass(PhotoBrowserCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: cellId)
        let layout = UICollectionViewFlowLayout()
        let itemWidth = (self.bounds.size.width - 2) / 3
        println((itemWidth))
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        layout.minimumInteritemSpacing = 1.0
        layout.minimumLineSpacing = 1.0
        
        //layout.footerReferenceSize = CGSize(width: collectionView!.bounds.size.width, height: 100.0)
        collectionView.collectionViewLayout = layout
        
        //collectionView.backgroundColor = UIColor.whiteColor()
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        println("fuck me baby the photo.count = " + String(photos.count))
        return photos.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as PhotoBrowserCollectionViewCell
        cell.imageView.image = UIImage(named: photos[indexPath.row])
        // Configure the cell
        
        return cell
    }

    
}
class PhotoBrowserCollectionViewCell: UICollectionViewCell {
    let imageView = UIImageView()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        
        imageView.frame = bounds
        addSubview(imageView)
    }
}
