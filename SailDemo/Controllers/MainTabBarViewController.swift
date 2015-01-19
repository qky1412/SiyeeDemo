//
//  MainTabBarViewController.swift
//  SailDemo
//
//  Created by qky on 15/1/5.
//  Copyright (c) 2015年 sail. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tabBar.alpha = 0.8
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], forState:.Normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], forState:.Selected)
        var tabBarItem1 = self.tabBar.items![0] as UITabBarItem
        tabBarItem1.selectedImage = UIImage(named: "tab1")!.imageWithRenderingMode(.AlwaysOriginal)
        tabBarItem1.image = UIImage(named:"tab1_unselected")!.imageWithRenderingMode(.AlwaysOriginal)
        var tabBarItem2 = self.tabBar.items![1] as UITabBarItem
        tabBarItem2.selectedImage = UIImage(named: "tab2")!.imageWithRenderingMode(.AlwaysOriginal)
        tabBarItem2.image = UIImage(named:"tab2_unselected")!.imageWithRenderingMode(.AlwaysOriginal)
        var tabBarItem3 = self.tabBar.items![2] as UITabBarItem
        tabBarItem3.selectedImage = UIImage(named: "tab3")!.imageWithRenderingMode(.AlwaysOriginal)
        tabBarItem3.image = UIImage(named:"tab3_unselected")!.imageWithRenderingMode(.AlwaysOriginal)
        // Do any additional setup after loading the view.
//        self.tabBar.backgroundColor = UIColor(netHex: 0x094ec5)
//        for item in self.tabBar.items as [UITabBarItem] {
//            if var image = item.image {
////                item.image = image.imageWithColor(UIColor.yellowColor()).imageWithRenderingMode(.AlwaysOriginal)
//                println("yes")
//                image = UIImage(named: "tab1.png")!
//            }
//        }

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
extension UIImage {
    func imageWithColor(tintColor: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        
        let context = UIGraphicsGetCurrentContext() as CGContextRef
        CGContextTranslateCTM(context, 0, self.size.height)
        CGContextScaleCTM(context, 1.0, -1.0);
        CGContextSetBlendMode(context, kCGBlendModeNormal)
        
        let rect = CGRectMake(0, 0, self.size.width, self.size.height) as CGRect
        CGContextClipToMask(context, rect, self.CGImage)
        tintColor.setFill()
        CGContextFillRect(context, rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext() as UIImage
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
