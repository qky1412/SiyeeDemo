//
//  HomeNC.swift
//  SailDemo
//
//  Created by qky on 15/1/23.
//  Copyright (c) 2015年 sail. All rights reserved.
//

import UIKit

class HomeNC: UINavigationController {
    var profileButton:UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        addProfile()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func addProfile(){
        profileButton = UIButton(frame: CGRectMake(10, 18, 60, 60))
        var image = UIImage(named: "profile1.png")
        profileButton!.setBackgroundImage(image, forState: UIControlState.Normal)
        profileButton!.layer.borderWidth = 2
        //profileButton.layer.borderColor = UIColor(netHex:0x007AFF).CGColor
        profileButton!.layer.borderColor = UIColor.groupTableViewBackgroundColor().CGColor
        profileButton!.layer.cornerRadius = profileButton!.frame.width / 2
        profileButton!.layer.masksToBounds = true;
        profileButton!.addTarget(self, action: "presentLeftMenuViewController:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(profileButton!)
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
