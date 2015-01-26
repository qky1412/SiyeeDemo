//
//  MenuTVC.swift
//  SailDemo
//
//  Created by qky on 15/1/20.
//  Copyright (c) 2015年 sail. All rights reserved.
//

import UIKit
enum MenuType: String{
    case Friends = "FriendsCell"
    case Message = "MessageCell"
    case Group = "GroupRecordsCell"
    case Purchase = "PurchaseCell"
    case Favorite = "GroupCell"
}
class MenuTVC: UITableViewController {


    var type = MenuType.Friends
    var friendsNames = ["陈浩", "李茜茜", "cyzup", "明明", "林恒"]
    var signatures = ["今天天气不错，适合出游", "will u be my friends?", "time waits for no one", "心一定要在路上", "呵呵"]
    var messages = ["下次组个组去云南吧", "多谢关注！", "hey, there~", "什么情况？", "恩恩知道了明天再聊"]
    var messageTimes = ["20:05", "18:24", "16:53", "12:40", "9:57", "06:19"]
    var groupRecordsTitles = ["厦大2010组", "武夷山2日游小分队", "云南艳遇小组", "冰雪奇缘", "一起冲天梯"]
    var groupRoutes =  ["厦门-哈尔滨-亚布力-雪乡6日游", "首尔济州6日游", "夏威夷8日5夜游", "甘肃彩虹山3日游", "四川九寨沟5日游"]
    var purchasePrices = ["2899", "6999", "24999", "3999", "2699"]
    var departures = ["厦门往返","厦门本地往返","厦门往返","上海集合目的地解散","厦门往返"]
    var prices = ["2599元起", "3899元起","12699元起","3699元起","5699元起"]
    var status = ["100组已出发/28组待出发", "15组已出发/5组待出发","5组已出发/36组待出发","2组已出发/199组待出发","244组已出发/500组待出发"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        switch type{
        case .Favorite:
            var cellNib = UINib(nibName: "GroupTableViewCell", bundle: nil)
            self.tableView.registerNib(cellNib, forCellReuseIdentifier: type.rawValue)
            self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        default:
            println("season in the sun")
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
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
        return 5
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        switch type{
        case .Friends:
            let cell = tableView.dequeueReusableCellWithIdentifier(type.rawValue, forIndexPath: indexPath) as FriendsListCell
            cell.profile.image = UIImage(named: "user\(indexPath.row + 1).png")
            cell.name.text = friendsNames[indexPath.row]
            cell.signature.text = signatures[indexPath.row]
            return cell
        case .Message:
            let cell = tableView.dequeueReusableCellWithIdentifier(type.rawValue, forIndexPath: indexPath) as MessageListCell
            cell.profile.image = UIImage(named: "user\(indexPath.row + 1).png")
            cell.name.text = friendsNames[indexPath.row]
            cell.content.text = messages[indexPath.row]
            cell.time.text = messageTimes[indexPath.row]
            return cell
        case .Group:
            let cell = tableView.dequeueReusableCellWithIdentifier(type.rawValue, forIndexPath: indexPath) as GroupRecordCell
            cell.groupName.text = groupRecordsTitles[indexPath.row]
            cell.groupRoute.text = groupRoutes[indexPath.row]
            var randomNumber = 8 + 4*(indexPath.row%2)
            cell.groupPeople.text = toString(randomNumber)
            return cell
        case .Purchase:
            let cell = tableView.dequeueReusableCellWithIdentifier(type.rawValue, forIndexPath: indexPath) as PurchaseRecordCell
            cell.price.text = purchasePrices[indexPath.row]
            cell.route.text = groupRoutes[indexPath.row]
            return cell
        case .Favorite:
            let cell = tableView.dequeueReusableCellWithIdentifier(type.rawValue, forIndexPath: indexPath) as GroupTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            cell.cover.image = UIImage(named: "scene\(indexPath.row+1).png")
            cell.title.text = groupRoutes[indexPath.row]
            cell.title.numberOfLines = 0
            cell.title.sizeToFit()
            cell.departure.text = departures[indexPath.row]
            cell.price.setTitle(prices[indexPath.row], forState: UIControlState.Normal)
            cell.price.sizeToFit()
            cell.price.layer.cornerRadius = 13
            cell.status.text = status[indexPath.row]

            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier(type.rawValue, forIndexPath: indexPath) as FriendsListCell
            cell.profile.image = UIImage(named: "user\(indexPath.row + 1).png")
            cell.name.text = friendsNames[indexPath.row]
            cell.signature.text = signatures[indexPath.row]
            return cell
            
        }
        
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(type == MenuType.Favorite){
            return 125
        }else{
            return 80
        }
    }


}
