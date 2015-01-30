//
//  RouteCVC.swift
//  SailDemo
//
//  Created by qky on 15/1/19.
//  Copyright (c) 2015年 sail. All rights reserved.
//

import UIKit

let headerIdentifier = "RouteHeader"
let cellIdentifier = "RouteGroupCell"
let sectionHeaderIdentifier = "RouteGroupSectionHeader"
class RouteCVC: UICollectionViewController {
    var routeTitle: String?
    var groupTitles = ["可不可以好好玩耍啦", "Wonderlands, 4ever!", "和谐号列车", "观光团一号"]
    var groupDescritions = ["大哥我专业带大家走心出游", "安静地，感受这里的美", "第一次开组希望大家给力", "路见不平一声吼啊"]
    var groupLeaders = ["喜哥", "Bobbb", "GeeGee", "出发出发再出发"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    func setupLayout(){
        var layout = self.collectionViewLayout as CSStickyHeaderFlowLayout
        layout.parallaxHeaderReferenceSize = CGSizeMake(view.bounds.width, 200)
        //layout.parallaxHeaderMinimumReferenceSize = CGSizeMake(view.bounds.width, 176)
        var headerNib = UINib(nibName: "RouteHeader", bundle: nil)
        self.collectionView!.registerNib(headerNib, forSupplementaryViewOfKind: CSStickyHeaderParallaxHeader, withReuseIdentifier: headerIdentifier)
        var cellNib = UINib(nibName: "RouteGroupCell", bundle: nil)
        self.collectionView!.registerNib(cellNib, forCellWithReuseIdentifier: cellIdentifier)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    override func viewWillAppear(animated: Bool) {
//        println(self.navigationController?.description)
//        if (self.navigationController!.isKindOfClass(HomeNC)){
//            if let button = (self.navigationController as HomeNC).profileButton{
//                button.hidden = true
//            }
//        }
//        
//
//    }
//    override func viewWillDisappear(animated: Bool) {
//        println(self.navigationController?.description)
//        if (self.navigationController!.isKindOfClass(HomeNC)){
//            if let button = (self.navigationController as HomeNC).profileButton{
//                button.hidden = false
//            }
//        }
//        
//    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1.0
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {

        return 10.0
        
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(view.frame.width - 10, 130)
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return groupTitles.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as RouteGroupCell
        cell.groupName.text = groupTitles[indexPath.row]
        cell.groupDescription.text = groupDescritions[indexPath.row]
        cell.groupLeader.text = groupLeaders[indexPath.row]
        cell.leaderProfile.image = UIImage(named: "user\(indexPath.row + 1)")
        
        return cell
    }
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        if kind == CSStickyHeaderParallaxHeader{
            var cell = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: headerIdentifier, forIndexPath: indexPath) as RouteHeader
            return cell
        }else{
            var cell = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: sectionHeaderIdentifier, forIndexPath: indexPath) as RouteGroupSectionHeader
            cell.detailButton.layer.cornerRadius = 4.0
            if let title = routeTitle{
                cell.routeTitle.text = title
            }
            
            return cell
        }
       
    }
  
}
