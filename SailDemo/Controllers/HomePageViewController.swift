//
//  FirstViewController.swift
//  SailDemo
//
//  Created by qky on 14/11/16.
//  Copyright (c) 2014年 sail. All rights reserved.
//

import UIKit
import Foundation
class HomePageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate{
    @IBOutlet weak var myBannerView: UIScrollView!
    @IBOutlet weak var myTableView: UITableView!
    
    var count = 5
    var banners : Array<String>!
    var users : Array<String>!
    var routes : Array<String>!
    var userCellId = "RecomUserCell"
    let routeCellId = "routeCellId"
    var screenSize:CGRect! = UIScreen.mainScreen().bounds
    var bannerWidth:CGFloat = 320
    var contentOffsetDictionary: NSMutableDictionary!
    let reuseTableViewCellIdentifier = "TableViewCell"
    let reuseCollectionViewCellIdentifier = "CollectionViewCell"
    
    var userNames = ["Jack", "如果爱", "MaryQ", "在路上", "请叫我旅人么么哒", "厦大一只狼", "西西", "Alex' Z", "NeverMore", "Puck"]
    var userScores = ["积分658", "积分246", "积分331", "积分980", "积分156", "积分658", "积分246", "积分331", "积分980", "积分156"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "爱走"
        self.myTableView!.tableFooterView = UIView(frame:CGRectZero)
        var viewsArray = NSMutableArray()
        for  i in 0...2 {
            var tempImgaeView = UIImageView(frame:CGRectMake(0, 0, self.view.frame.width, 150))
            tempImgaeView.image = UIImage(named:"banner\(i + 1).jpg")
            tempImgaeView.contentMode = UIViewContentMode.ScaleAspectFill
            tempImgaeView.clipsToBounds = true
            viewsArray.addObject(tempImgaeView)
        }
        
        var mainScorllView = YYCycleScrollView(frame:CGRectMake(0, 0, self.view.frame.width, 150),animationDuration:4.0)
        //mainScorllView.backgroundColor = UIColor.purpleColor()
        mainScorllView.fetchContentViewAtIndex = {(pageIndex:Int)->UIView in
            return viewsArray.objectAtIndex(pageIndex) as UIView
        }
        
        mainScorllView.totalPagesCount = {()->Int in
            return 3;
        }
        mainScorllView.TapActionBlock = {(pageIndex:Int)->() in
            println("点击了\(pageIndex)")
        }
        myTableView.tableHeaderView = mainScorllView
        
        var nib = UINib(nibName:"RecomRouteTableViewCell", bundle: nil)
        
        myTableView.registerNib(nib, forCellReuseIdentifier: routeCellId)
        
        //myTableView.registerClass(RecomUserTableViewCell.self, forCellReuseIdentifier: userCellId)
        myTableView.reloadData()
        
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {

    }
    override func didMoveToParentViewController(parent: UIViewController?) {
        //myTableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //making the avatar disappear 'cause the avatar is above the navigationbar we should hide it when second view is coming to top
    override func viewWillDisappear(animated: Bool) {
        if (self.navigationController!.isKindOfClass(HomeNC)){
            if let button = (self.navigationController as HomeNC).profileButton{
                UIView.animateWithDuration(0.5, animations: {
                    button.alpha = 0.0
                })
            }
        }
    }
    //same as viewWillDisappear, when this view is coming to top, we show the avartar
    override func viewDidAppear(animated: Bool) {
        if (self.navigationController!.isKindOfClass(HomeNC)){
            if let button = (self.navigationController as HomeNC).profileButton{
                UIView.animateWithDuration(0.3, animations: {
                    button.alpha = 1.0
                })
            }
        }
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var label : UILabel = UILabel(frame: CGRectMake(0,0,view.bounds.width, 44.0))
        if(section == 0){
            label.text = "推荐用户"
        } else if (section == 1){
            label.text = "推荐路线"
            var line = UIView(frame: CGRectMake(0, 0, label.bounds.width, 1))
            line.backgroundColor = UIColor.blackColor()
            label.addSubview(line)
        }
        label.textColor = UIColor(netHex:0x007AFF)
        label.font = UIFont(name: label.font.fontName, size: 13)
        label.backgroundColor = UIColor.whiteColor()
        return label
//        var view = UIView(frame: CGRectMake(0, 0, myTableView.bounds.width, 30))
//        view.addSubview(label)
//        view.backgroundColor = UIColor.whiteColor()
//        return view
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section != 1){
            return 1
        }else{
            return 5
        }
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var height:CGFloat
        
        height = 35
        return height
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let section = indexPath.section
        if(section == 0){
            return 110.0
        }else{
            return 160.0
        }
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if(section == 0){
            return 0.01
        }else {
            return 0.01
        }
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var section = indexPath.section
        
        
        if (section == 0){
            //var cell = tableView.dequeueReusableCellWithIdentifier(userCellId) as RecomUserTableViewCell
            var cell = tableView.dequeueReusableCellWithIdentifier(userCellId) as RecomUserCell
            cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self)
            
            return cell
        }else{
            var cell = tableView.dequeueReusableCellWithIdentifier(routeCellId) as RecomRouteTableViewCell
            cell.sampleCover.image = UIImage(named: "route\(indexPath.row).png")
            return cell
        }
        //cell.imageView.image = UIImage(named: "Blank52")
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if(indexPath.section > 0){
            var routeController = self.storyboard?.instantiateViewControllerWithIdentifier("RouteCVC") as RouteCVC
            routeController.hidesBottomBarWhenPushed = true
            //routeController.routeTitle = titles[indexPath.row]
            println(self.navigationController?.description)
            self.navigationController?.pushViewController(routeController, animated: true)

        }
    }

}
let collectionViewCellId = "RecomUserCollectionViewCell"
extension HomePageViewController:UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier(collectionViewCellId, forIndexPath: indexPath) as? RecomUserCollectionViewCell{
            cell.profile.image = UIImage(named: "profile\(indexPath.row+1).png")
            cell.name.text = userNames[indexPath.row]
            cell.score.text = userScores[indexPath.row]
            return cell
        }
        //cell.backgroundColor = UIColor.redColor()
       
        else{
            return UICollectionViewCell()
        }
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        var userController = self.storyboard?.instantiateViewControllerWithIdentifier("UserPageCVC") as UserPageCVC
        userController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(userController, animated: true)
    }
}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

