//
//  DiscoveryViewController.swift
//  SailDemo
//
//  Created by qky on 14/11/16.
//  Copyright (c) 2014年 sail. All rights reserved.
//

import UIKit

class DiscoveryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    let cellId = "DiscoveryCell"
    var names = ["陈浩", "李茜茜","阿明","醉步男","小林泰三"]
    var signatures = ["高尔夫 羽毛球 乒乓球", "跨国游  音乐", "自驾游 diving", "hiking", "暂无"]
    var photos = [["user11.png", "user12.png", "user13.png", "user14.png"],["user21.png", "user22.png", "user23.png", "user24.png"],["user31.png", "user32.png", "user33.png", "user34.png"],["user41.png", "user42.png", "user43.png", "user44.png"]]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "发现"
        // Do any additional setup after loading the view, typically from a nib.
        var nib = UINib(nibName:"DiscoveryTableViewCell", bundle: nil)
        
        tableView.registerNib(nib, forCellReuseIdentifier: cellId)
        //tableView.reloadData()
    }
    override func didMoveToParentViewController(parent: UIViewController?) {
        //tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as DiscoveryTableViewCell
        cell.name.text = names[indexPath.row]
        cell.signature.text = signatures[indexPath.row]
        cell.profile.image = UIImage(named: "user\(indexPath.row + 1).png")
        cell.photos = photos[indexPath.row]
        //cell.collectionView.reloadData()
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 140
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var userPageController = self.storyboard?.instantiateViewControllerWithIdentifier("UserPageCVC") as UserPageCVC
        userPageController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(userPageController, animated: true)
        
    }
}
