//
//  HomeNC.swift
//  SailDemo
//
//  Created by qky on 15/1/23.
//  Copyright (c) 2015年 sail. All rights reserved.
//

import UIKit
import ImageLoader
class HomeNC: UINavigationController {
    var profileButton:UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        addProfile()
        // Do any additional setup after loading the view.
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "receiveAccountInfoChanged:", name: "AccountInfoChange", object: nil)
    
}
func receiveAccountInfoChanged(notification: NSNotification){
    var accountInfo = notification.object as AccountInfo?
    var urlString: String! = accountInfo?.profile
    var url =  NSURL(string: urlString)
    ImageLoader.load(url!).completionHandler { completedURL, image, error in
        self.profileButton!.setBackgroundImage(image, forState: UIControlState.Normal)
    }
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func addProfile(){
        
        profileButton = UIButton(frame: CGRectMake(10, 18, 60, 60))
        if let accountInfo = AppTools.AccountTool.getAccountInfo(){
            var urlString: String! = accountInfo.profile
            var url =  NSURL(string: urlString)
            ImageLoader.load(url!).completionHandler { completedURL, image, error in
                self.profileButton!.setBackgroundImage(image, forState: UIControlState.Normal)
            }
        }
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
