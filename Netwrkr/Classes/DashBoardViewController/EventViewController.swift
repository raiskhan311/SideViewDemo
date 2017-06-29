//
//  EventViewController.swift
//  Netwrkr
//
//  Created by mac on 17/06/17.
//  Copyright © 2017 Vipin Dhangar. All rights reserved.
//

import UIKit

class EventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var SideViewLeadingConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var view_SideMenu: UIView!
    
    @IBOutlet weak var img_ProfileImage: UIImageView!
    
    var menuShowing = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view_SideMenu.layer.shadowOpacity = 1
        view_SideMenu.layer.shadowRadius = 3
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "EVENTS"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    //Mark: - Side Menu Action
    @IBAction func btn_OpenSideMenu(_ sender: Any) {
        if (menuShowing){
            SideViewLeadingConstraints.constant = -295
        }
        else{
            SideViewLeadingConstraints.constant = 0
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        menuShowing = !menuShowing
    }
    
    //Mark:- button Action
    @IBAction func btn_ProfileSettings(_ sender: Any) {
    }
    
    @IBAction func btn_ProfileFAQs(_ sender: Any) {
    }
    
    @IBAction func btn_ProfileSignout(_ sender: Any) {
    }
    
    @IBAction func btn_ExitBarbutton(_ sender: Any) {
        
    }
    
    //Mark: - Table DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
