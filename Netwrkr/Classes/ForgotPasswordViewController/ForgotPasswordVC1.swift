//
//  ForgotPasswordVC1.swift
//  Netwrkr
//
//  Created by mac on 16/06/17.
//  Copyright © 2017 Vipin Dhangar. All rights reserved.
//

import UIKit

class ForgotPasswordVC1: UIViewController, UITextFieldDelegate {

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
        self.navigationItem.title = "Forgot Password"
    }

    //Mark :- Hide keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }

    
}
