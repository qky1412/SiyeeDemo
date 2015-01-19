//
//  UserPageTVC.swift
//  SailDemo
//
//  Created by qky on 15/1/13.
//  Copyright (c) 2015年 sail. All rights reserved.
//

import UIKit

class UserPageTVC: UITableViewController {
    var controller: HMSegmentedControl!
    let id = "UserPageGalleryTableViewCell"
    var photos = ["user11", "user12", "user13", "user14", "user21", "user22", "user23", "user24", "user31", "user32", "user33", "user34", "user41", "user42", "user43", "user44"]
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupViews(){
        tableView.tableHeaderView = headerView
        
       
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
        return 1
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(id) as UserPageGalleryTableViewCell
        println(cell.bounds.height)
        return cell
    }
    
    @IBOutlet weak var headerView: UIView!
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if self.controller != nil{
            return controller.bounds.height
        }else{
            return 50
        }
    }
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        controller = HMSegmentedControl(sectionTitles: ["相册", "个人信息", "状态", "游记"])
        controller.selectedTextColor = UIColor.blueColor()
        controller.frame = CGRectMake(0, 0, view.frame.width, 50);
        controller.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown
        controller.segmentEdgeInset = UIEdgeInsets(top: 10,left: 0,bottom: 10,right: 0)
        controller.alpha = 0.8
        controller.addTarget(self, action: "controllerChanged:", forControlEvents:UIControlEvents.ValueChanged)
        return controller
    }
    func controllerChanged(sender:AnyObject){
       println("fuck" + String(controller.selectedSegmentIndex))
    }


}
