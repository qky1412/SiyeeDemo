//
//  SecondViewController.swift
//  SailDemo
//
//  Created by qky on 14/11/16.
//  Copyright (c) 2014年 sail. All rights reserved.
//

import UIKit

class GroupController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var filterVIew: UIView!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var destinationButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var order:String! = "综合排序"
    var destination = "全部"
    var route = "优惠路线"
    var lowerPrice = 1000
    var upperPrice = 5000
    
    var titles =  ["厦门-哈尔滨-亚布力-雪乡6日游", "首尔济州6日游", "夏威夷8日5夜游", "甘肃彩虹山3日游", "四川九寨沟5日游"]
    var departures = ["厦门往返","厦门本地往返","厦门往返","上海集合目的地解散","厦门往返"]
    var prices = ["2599元起", "3899元起","12699元起","3699元起","5699元起"]
    var status = ["100组已出发/28组待出发", "15组已出发/5组待出发","5组已出发/36组待出发","2组已出发/199组待出发","244组已出发/500组待出发"]
    
    let groupCellId = "GroupCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        var nib = UINib(nibName:"GroupTableViewCell", bundle: nil)
        
        tableView.registerNib(nib, forCellReuseIdentifier: groupCellId)
        tableView.tableFooterView = UIView(frame:CGRectZero)
        tableView.reloadData()

    }
    override func didMoveToParentViewController(parent: UIViewController?) {
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return filterVIew
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(groupCellId) as GroupTableViewCell
        cell.cover.image = UIImage(named: "scene\(indexPath.row+1).png")
        cell.title.text = titles[indexPath.row]
        cell.title.numberOfLines = 0
        cell.title.sizeToFit()
        cell.departure.text = departures[indexPath.row]
        cell.price.setTitle(prices[indexPath.row], forState: UIControlState.Normal)
        cell.price.sizeToFit()
        cell.price.layer.cornerRadius = 13
        //cell.price.layer.backgroundColor = UIColor.redColor()
        cell.status.text = status[indexPath.row]
       
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 125
    }
//    func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
//        var cell = tableView.cellForRowAtIndexPath(indexPath) as GroupTableViewCell
//        cell.back.backgroundColor = UIColor.orangeColor()
//    }
    @IBAction func selectedOrder(segue:UIStoryboardSegue) {
        let orderViewController = segue.sourceViewController as OrderTableViewController
        order = orderViewController.selectedOrder
        orderButton.setTitle(order, forState: UIControlState.Normal)
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    @IBAction func cancelOrder(segue:UIStoryboardSegue){
        self.navigationController?.popViewControllerAnimated(true)
    }
    @IBAction func selectedDestination(segue:UIStoryboardSegue) {
        let destinationViewController = segue.sourceViewController as GroupDestinationTVC
        destination = destinationViewController.selectedDestination
        destinationButton.setTitle(destination, forState: UIControlState.Normal)
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    @IBAction func selectedFilter(segue:UIStoryboardSegue){
        let filterViewController = segue.sourceViewController as GroupFilterTVC
        route = filterViewController.selectedRoutes
        lowerPrice = filterViewController.selectedLowerPrice
        upperPrice = filterViewController.selectedUpperPrice
        self.navigationController?.popViewControllerAnimated(true)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ToPickOrder" {
            
            let orderViewController = segue.destinationViewController.childViewControllers[0] as OrderTableViewController
            orderViewController.selectedOrder = order
        }
        else if segue.identifier == "ToPickDestination" {
            let destinationViewController = segue.destinationViewController.childViewControllers[0] as GroupDestinationTVC
            destinationViewController.selectedDestination = destination
        }else if segue.identifier == "ToPickFilter"{
            let filterViewController = segue.destinationViewController.childViewControllers[0] as
                GroupFilterTVC
            filterViewController.selectedRoutes = route
            filterViewController.selectedLowerPrice = lowerPrice
            filterViewController.selectedUpperPrice = upperPrice
        }
    }
}

