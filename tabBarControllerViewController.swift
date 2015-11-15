//
//  tabBarControllerViewController.swift
//  atnow-iOS
//
//  Created by Benjamin Holland on 11/14/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit

class tabBarControllerViewController: UITabBarController {
    
    let designHelper = DesignHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = designHelper.baseColor
        // Do any additional setup after loading the view.
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
