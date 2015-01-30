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

    @IBOutlet var radioButtonGroup: [DLRadioButton]!
    @IBOutlet weak var lbDeparture: UILabel!
    @IBOutlet weak var btnTime: UIButton!
    @IBOutlet weak var tfGroupSign: UITextField!
    
    @IBOutlet weak var groupNumbersView: UIView!
    var dateStrings = ["2015年2月1号","2015年2月8号","2015年2月15号","2015年2月22号","2015年2月29号"]
    var peopleLimits = ["6", "8", "16"]
    @IBAction func btnTimeClick(sender: UIButton) {
        var mPicker = ActionSheetStringPicker(title: "选择出发日期", rows: dateStrings, initialSelection: 0, doneBlock: {(ActionSheetStringPicker picker, NSInteger selectedIndex, id selectedValue) in return {self.refreshDate(selectedIndex)}()}, cancelBlock: {ActionStringCancelBlock in return }, origin: sender.superview!.superview)
        mPicker.showActionSheetPicker()
    }
    func refreshDate(selectedIndex: Int){
        btnTime.setTitle(dateStrings[selectedIndex], forState:UIControlState.Normal)
    }
    //@IBOutlet var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGroupNumbersView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupGroupNumbersView(){
        for i in 0...2{
            var button = radioButtonGroup[i]
            button.setTitle(peopleLimits[i], forState: UIControlState.Normal)
            button.ButtonIcon = UIImage(named: "radioButtonPeople")
            button.ButtonIconSelected = UIImage(named: "radioButtonPeopleChecked")
            button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        }
        radioButtonGroup[1].selected = true
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
