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
    var userCellId = "RecomUserTableViewCell"
    let routeCellId = "routeCellId"
    var screenSize:CGRect! = UIScreen.mainScreen().bounds
    var bannerWidth:CGFloat = 320
    var contentOffsetDictionary: NSMutableDictionary!
    let reuseTableViewCellIdentifier = "TableViewCell"
    let reuseCollectionViewCellIdentifier = "CollectionViewCell"
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "爱走"
        // Do any additional setup after loading the view, typically from a nib.
//        myBannerView.tag = -1;
//        myBannerView.backgroundColor = UIColor.grayColor()
//        myBannerView.pagingEnabled = true
//        myBannerView.delegate = self
//        myBannerView.showsHorizontalScrollIndicator = false
//        screenSize = UIScreen.mainScreen().bounds
//        var bannerWidth = screenSize.width
//        myBannerView.contentSize = CGSizeMake(bannerWidth*3, 150)
//        var x:CGFloat = 0.0
//        for  i in 1...3{
//            var imageView = UIImageView(frame: CGRectMake(x, 0, bannerWidth, 150))
//            imageView.image = UIImage(named:"banner\(i).jpg")
//            myBannerView.addSubview(imageView)
//            x += bannerWidth
//        }
//        myTableView.tableHeaderView = myBannerView
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
        
        myTableView.registerClass(RecomUserTableViewCell.self, forCellReuseIdentifier: userCellId)
        myTableView.reloadData()
        
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
//        var stopPoint: CGPoint = myBannerView.contentOffset
//        var stopIndex  = (stopPoint.x)/bannerWidth
//        myPage.currentPage = Int(stopIndex)
//        println("current page =   \(stopIndex)")
//        if(scrollView.tag == -1){
//            myTableView.reloadData()
//        }
        
    }
    override func didMoveToParentViewController(parent: UIViewController?) {
        //myTableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if(section == 0){
//            return "推荐用户"
//        }else{
//            return "推荐路线"
//        }
//    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var label : UILabel = UILabel()
        if(section == 0){
            label.text = "推荐用户"
        } else if (section == 1){
            label.text = "推荐路线"
        }
        label.textColor = UIColor(netHex:0x007AFF)
        label.font = UIFont(name: label.font.fontName, size: 13)
        return label
//        var view = UIView(frame: CGRectMake(0, 0, myTableView.bounds.width, 30))
//        view.backgroundColor = UIColor.grayColor()
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
            return 60.0
        }else{
            return 160.0
        }
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if(section == 0){
            return 50
        }else {
            return 0
        }
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var section = indexPath.section
        
        
        if (section == 0){
            var cell = tableView.dequeueReusableCellWithIdentifier(userCellId) as RecomUserTableViewCell
            return cell
        }else{
            var cell = tableView.dequeueReusableCellWithIdentifier(routeCellId) as RecomRouteTableViewCell
            cell.sampleCover.image = UIImage(named: "route\(indexPath.row).png")
            return cell
        }
        //cell.imageView.image = UIImage(named: "Blank52")
        
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

