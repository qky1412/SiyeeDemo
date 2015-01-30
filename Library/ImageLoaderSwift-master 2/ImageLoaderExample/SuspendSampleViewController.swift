//
//  SuspendSampleViewController.swift
//  ImageLoaderExample
//
//  Created by Hirohisa Kawasaki on 2014/12/18.
//  Copyright (c) 2014年 Hirohisa Kawasaki. All rights reserved.
//

import UIKit
import ImageLoader

class SuspendSampleViewController: UITableViewController {

    var URLs: [NSURL] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let buttonItem = UIBarButtonItem(barButtonSystemItem: .Play, target: self, action: "play")
        self.navigationItem.rightBarButtonItem = buttonItem
    }

    func play() {
        self.toggle(loading: true)
        self.startLoading()
    }

    func pause() {
        self.toggle(loading: false)
        self.pauseLoading()
    }

    func toggle(#loading: Bool) {
        var buttonItem = UIBarButtonItem(barButtonSystemItem: .Play, target: self, action: "play")

        if loading == true {
            buttonItem = UIBarButtonItem(barButtonSystemItem: .Pause, target: self, action: "pause")
        }
        self.navigationItem.rightBarButtonItem = buttonItem
    }


    func startLoading() {
        let start = self.URLs.count
        for i in start...start+10 {
            let URL = NSURL.imageURL(i)
            ImageLoader.load(URL).completionHandler { completedURL, image, error in
                self.insertRow(completedURL)
            }
        }
    }

    func pauseLoading() {
        let end = self.URLs.count
        for i in end-10...end {
            let URL = NSURL.imageURL(i)
            ImageLoader.suspend(URL)
        }
    }

    func insertRow(URL: NSURL) {

        dispatch_async(dispatch_get_main_queue(), {
            let indexPath = NSIndexPath(forRow: self.URLs.count, inSection: 0)
            self.URLs.append(URL)

            self.tableView.beginUpdates()
            self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            self.tableView.endUpdates()

            var state = ImageLoader.state
            if state == .Ready {
                self.toggle(loading: false)
            }
        })

    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        let URL = self.URLs[indexPath.row]
        let placeholder = UIImage(named: "black.jpg")!
        cell.textLabel?.text = URL.absoluteString

        if let image = ImageLoader.cache(URL) {
            cell.imageView?.image = image
        }

        return cell

    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.URLs.count
    }

}