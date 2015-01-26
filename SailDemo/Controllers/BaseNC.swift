//
//  BaseNC.swift
//  SailDemo
//
//  Created by qky on 15/1/21.
//  Copyright (c) 2015年 sail. All rights reserved.
//

import UIKit

class BaseNC: UINavigationController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBarHidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        self.navigationBarHidden = true
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
