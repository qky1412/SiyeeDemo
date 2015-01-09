//
//  GroupDestinationTVC.swift
//  SailDemo
//
//  Created by qky on 15/1/8.
//  Copyright (c) 2015年 sail. All rights reserved.
//

import UIKit

class GroupDestinationTVC: UITableViewController {
    var destinations = ["全部","国内", "港澳台", "日韩", "海岛", "其他"]
    let id = "GroupDestinationCell"
    var selectedDestination:String! = "全部"
    var selectedDestinationIndex:Int! = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        if let order = selectedDestination {
            selectedDestinationIndex = find(destinations, order)!
        }
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
        return destinations.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(id, forIndexPath: indexPath) as UITableViewCell
        cell.textLabel.text = destinations[indexPath.row]
        
        if indexPath.row == selectedDestinationIndex {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let index = selectedDestinationIndex
        let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0))
        cell!.accessoryType = .None
        
        
        selectedDestinationIndex = indexPath.row
        selectedDestination = destinations[indexPath.row]
        
        //update the checkmark for the current row
        let cell2 = tableView.cellForRowAtIndexPath(indexPath)
        cell2!.accessoryType = .Checkmark
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("GroupDestinationTVC segue identifier = " + segue.identifier!)
        if segue.identifier == "SelectDestination" {
            let cell = sender as UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            selectedDestinationIndex = indexPath!.row
            let index = selectedDestinationIndex
            selectedDestination = destinations[index]
        }
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
