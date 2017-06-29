//
//  DashBoardViewController.swift
//  Netwrkr
//
//  Created by mac on 15/06/17.
//  Copyright © 2017 Vipin Dhangar. All rights reserved.
//

import UIKit

class DashBoardViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Dash Board"
    }
}
