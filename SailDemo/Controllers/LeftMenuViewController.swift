//
//  LeftMenuViewController.swift
//  SailDemo
//
//  Created by qky on 14/11/25.
//  Copyright (c) 2014年 sail. All rights reserved.
//

import UIKit
import ImageLoader
class LeftMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, RESideMenuDelegate {
    var menus = ["menu_info","menu_friends","menu_message","menu_group","menu_pay","menu_favorite"]
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var signature: UILabel!
    @IBOutlet weak var login: UIButton!
    @IBAction func loginPressed(sender: AnyObject) {
        println("login button pressed!")
        var request: WBAuthorizeRequest! = WBAuthorizeRequest.request() as WBAuthorizeRequest
        request.redirectURI = "https://api.weibo.com/oauth2/default.html"
        request.scope = "all"
        WeiboSDK.sendRequest(request)
    }

    var cellId = "leftMenuCell"
    var menuTitles =  ["资料", "好友", "消息", "开组", "支付", "收藏", "设置", "关于"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        self.view.backgroundColor = UIColor.clearColor()
        myTableView.backgroundColor = UIColor.clearColor()
        myTableView.opaque = false
        myTableView.backgroundView = nil
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "receiveAccountInfoChanged:", name: "AccountInfoChange", object: nil)

    }
    func receiveAccountInfoChanged(notification: NSNotification){
        var accountInfo = notification.object as AccountInfo?
        self.name.text = accountInfo?.name
        self.name.hidden = false
        self.login.hidden = true
        var urlString: String! = accountInfo?.profile
        var url =  NSURL(string: urlString)
        self.profile.load(url!, placeholder: UIImage(named: "profile1.png")){ _ in }
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as UITableViewCell
        //cell.selectionStyle = UITableViewCellSelectionStyle.Blue
        cell.imageView!.image = UIImage(named: menus[indexPath.row])
        cell.textLabel!.textColor = UIColor.whiteColor()
        cell.textLabel!.text = menuTitles[indexPath.row]
        cell.backgroundColor = UIColor.clearColor()
        //cell.contentView.transform = CGAffineTransformMakeRotation( (CGFloat)(M_PI / 2))
        return cell
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        var customView = NSBundle.mainBundle().loadNibNamed("LeftMenuHeader",owner: self, options: nil)[0] as? UIView
//        return customView!
        var headerxib:UIView = NSBundle.mainBundle().loadNibNamed("LeftMenuHeader", owner: self, options: nil).first as UIView
        var tableheader = UIView(frame: CGRectMake(0, 0, 250, 120))
        tableheader.addSubview(headerxib)
        
        if let accountInfo = AppTools.AccountTool.getAccountInfo(){
            var name = accountInfo.name
            self.name.text = name
            self.name.hidden = false
            self.login.hidden = true
            var urlString: String! = accountInfo.profile
            var url =  NSURL(string: urlString)
            self.profile.load(url!, placeholder: UIImage(named: "profile1.png")){ _ in }
        }else{
            name.hidden = true
            signature.hidden = true
        }
        self.profile.layer.borderWidth = 2
        
        self.profile.layer.borderColor = UIColor.groupTableViewBackgroundColor().CGColor
        self.profile.layer.cornerRadius = profile!.frame.width / 2
        self.profile.layer.masksToBounds = true;

        return tableheader
        
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        var menuController = self.storyboard?.instantiateViewControllerWithIdentifier("MenuTVC") as MenuTVC
        //var userPage = self.storyboard?.instantiateViewControllerWithIdentifier("UserPageCVC") as UserPageCVC
        switch indexPath.row{
  
        case 1:
            menuController.type = MenuType.Friends
        case 2:
            menuController.type = MenuType.Message
        case 3:
            menuController.type = MenuType.Group
        case 4:
            menuController.type = MenuType.Purchase
        case 5:
            menuController.type = MenuType.Favorite
        default:
            menuController.type = MenuType.Friends
        }
        menuController.hidesBottomBarWhenPushed = true
        (self.sideMenuViewController.contentViewController as BaseNC).pushViewController(menuController, animated: true)
        self.sideMenuViewController.hideMenuViewController()
        
        
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
