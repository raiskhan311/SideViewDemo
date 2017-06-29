//
//  CreateEventVC.swift
//  Netwrkr
//
//  Created by mac on 17/06/17.
//  Copyright © 2017 Vipin Dhangar. All rights reserved.
//

import UIKit

class CreateEventVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Create Events"
    }

    @IBAction func btn_Back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
