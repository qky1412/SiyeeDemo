//
//  UserPageCVC.swift
//  SailDemo
//
//  Created by qky on 15/1/13.
//  Copyright (c) 2015年 sail. All rights reserved.
//

import UIKit


class UserPageCVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {


    var reloadTimes = 0
    let reuseIdentifier = "UserPageCell", statusCellId = "StatusCell", groupCellId = "GroupCell", journalCellId = "JournalCellId"
    let headerId = "UserPageHeader"
    let sectionHeaderId = "sectionHeader"
    var photos = ["user11", "user12", "user13", "user14", "user21", "user22", "user23", "user24", "user31", "user32", "user33", "user34", "user41", "user42", "user43", "user44"]
    var photos2 = ["user24", "user31", "user32"]
    var status = ["年龄: 21", "常出没: 厦门", "个人说明: whatever", "喜欢的音乐: Can't take my eyes off u", "电影: 大城小爱"]
    var groupTitles = ["走你!" ,"厦大同学看过来", "2010届的一起"]
    var journalContents = ["今天厦门天气真好，植物园人真多", "来到白城看见依旧美丽的海", "想起来那时候在五缘湾坐船的情景"]
    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupViews(){
        
        setupCollectionViewLayout()
        self.collectionView!.registerClass(PhotoBrowserCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: reuseIdentifier)
        var statusNib = UINib(nibName: "UserPageStatusCell", bundle: nil)
        //self.collectionView!.registerNib(statusNib, forCellWithReuseIdentifier: statusCellId)
    }

    func setupCollectionViewLayout() {
        var layout = self.collectionViewLayout as CSStickyHeaderFlowLayout
        layout.parallaxHeaderReferenceSize = CGSizeMake(view.bounds.width, 176)
        layout.parallaxHeaderMinimumReferenceSize = CGSizeMake(view.bounds.width, 176)
        var headerNib = UINib(nibName: "UserPageHeader", bundle: nil)
        self.collectionView?.registerNib(headerNib, forSupplementaryViewOfKind: CSStickyHeaderParallaxHeader, withReuseIdentifier: headerId)
        


    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1.0
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        var layout = self.collectionViewLayout as CSStickyHeaderFlowLayout
        switch selectedIndex{
        case 0:
           return 1.0
        default:
            return 10.0
        }
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if(selectedIndex == 0){
            let itemWidth = (view.bounds.size.width - 2) / 3
            return CGSizeMake(itemWidth, itemWidth)
        }else if(selectedIndex == 1){
            return CGSizeMake(view.frame.width, 44)
        }else if(selectedIndex == 2){
            return CGSizeMake(view.frame.width - 20, 100)
        }else{
            return CGSizeMake(view.frame.width - 20, 80)
        }
        
    }
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        if(kind == CSStickyHeaderParallaxHeader){
            var cell = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: headerId, forIndexPath: indexPath) as UserPageHeader
            
            cell.name.text = "醉步男" + String(reloadTimes)
            
            var controller = HMSegmentedControl(sectionTitles: ["相册", "个人信息", "状态", "游记"])
            controller.selectedTextColor = UIColor(netHex:0x007AFF)
            controller.selectionIndicatorColor = UIColor(netHex:0x007AFF)
            controller.frame = CGRectMake(0, 0, view.frame.width, 38);
            controller.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown
            controller.selectionIndicatorHeight = 3
            controller.addTarget(self, action: "controllerChanged:", forControlEvents:UIControlEvents.ValueChanged)
            var line = UIView(frame: CGRectMake(0, 0, controller.bounds.width, 1))
            line.backgroundColor = UIColor.grayColor()
            controller.addSubview(line)
            cell.controllerView.addSubview(controller)
            
            return cell
        }
        else{
            var cell = UICollectionReusableView()
            return cell
        }
    }
    func controllerChanged(sender: AnyObject){
        selectedIndex = (sender as HMSegmentedControl).selectedSegmentIndex
        reloadTimes++
        let range = NSMakeRange(0, self.collectionView!.numberOfSections())
        let indexSet = NSIndexSet(indexesInRange: range)
        self.collectionView!.reloadSections(indexSet)

    }
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        if(selectedIndex == 0){
            return photos.count
        }else if(selectedIndex == 1){
            return status.count
        }else if(selectedIndex == 2){
            return groupTitles.count
        }
        else{
            return journalContents.count
        }
        
        
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        switch selectedIndex{
        case 0:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as PhotoBrowserCollectionViewCell
            cell.imageView.image = UIImage(named: photos[indexPath.row])
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(statusCellId, forIndexPath: indexPath) as UserPageStatusCell
            cell.title.text = status[indexPath.row]
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(groupCellId, forIndexPath: indexPath) as UserPageGroupCell
            cell.title.text = groupTitles[indexPath.row]
            cell.layer.borderWidth = 0.5
            cell.layer.borderColor = UIColor(netHex:0xbebebe).CGColor
            return cell
        default:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(journalCellId, forIndexPath: indexPath) as UserPageJournal
            cell.content.text = groupTitles[indexPath.row]
            cell.layer.borderWidth = 0.5
            cell.layer.borderColor = UIColor(netHex:0xbebebe).CGColor
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
            
            //backgroundColor = UIColor(white: 0.1, alpha: 1.0)
            
            imageView.frame = bounds
            addSubview(imageView)
        }
    }
    
}


class StickyHeaderCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        var answer = super.layoutAttributesForElementsInRect(rect)! as [UICollectionViewLayoutAttributes]
        var cv = self.collectionView!
        
        var contentOffset = cv.contentOffset
        
        var missingSections = NSMutableIndexSet()
        for layoutAttributes in answer {
            if layoutAttributes.representedElementCategory == UICollectionElementCategory.Cell {
                if layoutAttributes.indexPath == nil {
                    continue
                }
                missingSections.addIndex(layoutAttributes.indexPath!.section)
            }
        }
        
        for layoutAttributes in answer {
            if layoutAttributes.representedElementKind == nil {
                continue
            }
            
            if layoutAttributes.representedElementKind == UICollectionElementKindSectionHeader {
                if layoutAttributes.indexPath == nil {
                    continue
                }
                missingSections.removeIndex(layoutAttributes.indexPath!.section)
            }
        }
        
        missingSections.enumerateIndexesUsingBlock { (idx, stop) -> Void in
            var indexPath = NSIndexPath(forItem: 0, inSection: idx)
            
            var layoutAttributes = self.layoutAttributesForSupplementaryViewOfKind(UICollectionElementKindSectionHeader, atIndexPath: indexPath)
            if let att = layoutAttributes{
                answer.append(att)
            }
            
        }
        
        for layoutAttributes in answer {
            if layoutAttributes.representedElementKind == nil {
                continue
            }
            
            if layoutAttributes.representedElementKind == UICollectionElementKindSectionHeader {
                var section = layoutAttributes.indexPath!.section
                var numberOfItemsInSection = cv.numberOfItemsInSection(section)
                
                var firstCellIndexPath = NSIndexPath(forItem: 0, inSection: section)
                var lastCellIndexPath = NSIndexPath(forItem: max(0, (numberOfItemsInSection - 1)), inSection: section)
                
                var firstCellAttrs = self.layoutAttributesForItemAtIndexPath(firstCellIndexPath)
                var lastCellAttrs = self.layoutAttributesForItemAtIndexPath(lastCellIndexPath)
                
                var headerHeight = CGRectGetHeight(layoutAttributes.frame)
                println(headerHeight)
                var origin = layoutAttributes.frame.origin
                
               origin.y = min(contentOffset.y, (CGRectGetMaxY(lastCellAttrs.frame) - headerHeight))
                //origin.y = min(max(contentOffset.y, (CGRectGetMinY(firstCellAttrs.frame) - headerHeight)), (CGRectGetMaxY(lastCellAttrs.frame) - headerHeight))
                (layoutAttributes as UICollectionViewLayoutAttributes).zIndex = 1024
                (layoutAttributes as UICollectionViewLayoutAttributes).frame = CGRect(origin: origin, size: layoutAttributes.frame.size)
            }
            
        }
        
        return answer
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
}
class PhotoBrowserLoadingCollectionView: UICollectionReusableView {
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        spinner.startAnimating()
        spinner.center = self.center
        addSubview(spinner)
    }
}
