//
//  RequestedTasksNavigationControllerViewController.swift
//  atnow-iOS
//
//  Created by Benjamin Holland on 2/2/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class RequestedTasksNavigationControllerViewController: UINavigationController {

    let designHelper = DesignHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = designHelper.baseColor.colorWithAlphaComponent(0.3)
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        
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
