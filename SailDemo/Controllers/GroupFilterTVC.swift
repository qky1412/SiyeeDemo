//
//  GroupFilterTVC.swift
//  SailDemo
//
//  Created by qky on 15/1/9.
//  Copyright (c) 2015年 sail. All rights reserved.
//

import UIKit

class GroupFilterTVC: UITableViewController {
    @IBOutlet weak var lowerLabel: UILabel!
    @IBOutlet weak var upperLabel: UILabel!
    @IBOutlet weak var slider: NMRangeSlider!
    var routes = ["优惠路线","活动专线"]
    let id = "GroupFilterCell"
    var selectedRoutes:String! = "优惠路线"
    var selectedRoutesIndex:Int! = 0
    var selectedLowerPrice:Int! = 1000
    var selectedUpperPrice:Int! = 5000
    var cellId = "GroupFilterCell"
    var footerId = "GroupFilterCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        if let route = selectedRoutes {
            selectedRoutesIndex = find(routes, route)!
        }
        initSlider()
    }
    func initSlider(){
        self.slider.minimumValue = 0;
        self.slider.maximumValue = 100;
        self.slider.lowerValue = 20
        self.slider.upperValue = 80
        self.slider.stepValue = 10
        self.slider.minimumRange = 10
    }
    @IBAction func priceChanged(sender: AnyObject) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return routes.count
    }
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footerView
    }
    @IBOutlet weak var footerView: UIView!
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as UITableViewCell
        cell.textLabel!.text = routes[indexPath.row]
        
        if indexPath.row == selectedRoutesIndex {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let index = selectedRoutesIndex
        let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0))
        cell!.accessoryType = .None
        
        
        selectedRoutesIndex = indexPath.row
        selectedRoutes = routes[indexPath.row]
        
        //update the checkmark for the current row
        let cell2 = tableView.cellForRowAtIndexPath(indexPath)
        cell2!.accessoryType = .Checkmark
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("GroupFilterTVC segue identifier = " + segue.identifier!)
        if segue.identifier == "SelectedFilter" {
            
        }
    }
}
