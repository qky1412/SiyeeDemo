//
//  NewGroupVC.swift
//  SailDemo
//
//  Created by qky on 15/1/26.
//  Copyright (c) 2015年 sail. All rights reserved.
//

import UIKit

class NewGroupVC: UIViewController {
    @IBOutlet weak var tfGroupName: UITextField!

    @IBOutlet weak var lbDeparture: UILabel!
    @IBOutlet weak var btnTime: UIButton!
    @IBOutlet weak var tfGroupSign: UITextField!
    @IBAction func btnTimeClick(sender: UIButton) {
        var datePicker = ActionSheetDatePicker(title: "选择出发日期", datePickerMode: UIDatePickerMode.Date, selectedDate: NSDate(), doneBlock: {ActionStringDoneBlock in return println("fuck u")}, cancelBlock: {ActionStringCancelBlock in return }, origin: sender.superview!.superview)
//        var datePicker = ActionSheetDatePicker(title: "选择出发日期", datePickerMode: UIDatePickerMode.Date, selectedDate: NSDate(), target: self, action: "refreshDate:", origin: sender.superview!.superview)
        let secondsInWeek: NSTimeInterval = 7 * 24 * 60 * 60;
        datePicker.minimumDate = NSDate(timeInterval: -secondsInWeek, sinceDate: NSDate())
        datePicker.maximumDate = NSDate(timeInterval: secondsInWeek, sinceDate: NSDate())
        
        datePicker.showActionSheetPicker()
    }
    func refreshDate(obj:NSDate){
        println("hehe")
    }
    //@IBOutlet var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //scrollView.directionalLockEnabled = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
