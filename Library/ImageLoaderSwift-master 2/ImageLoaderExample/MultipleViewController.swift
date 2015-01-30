//
//  MultipleViewController.swift
//  ImageLoaderSample
//
//  Created by Hirohisa Kawasaki on 2014/10/24.
//  Copyright (c) 2014年 Hirohisa Kawasaki. All rights reserved.
//

import UIKit
import ImageLoader

class MultipleViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        let URL = NSURL.imageURL(indexPath.row)
        let placeholder = UIImage(named: "black.jpg")!
        cell.imageView?.load(URL, placeholder: placeholder, completionHandler:  { (URL, image, error) -> () in
            println("URL \(URL)")
            println("error \(error)")
            println("view's size \(cell.imageView?.frame.size), image's size \(cell.imageView?.image?.size)")
        })

        return cell

    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

}
