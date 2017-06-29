//
//  ViewController.swift
//  Netwrkr
//
//  Created by Vipin Dhangar on 17/04/17.
//  Copyright © 2017 Vipin Dhangar. All rights reserved.
//

import UIKit

let deviceHeight = UIScreen.main.bounds.size.height
let deviceWidth = UIScreen.main.bounds.size.width

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var vwImages : UIView!
    @IBOutlet var scrollView : UIScrollView!
    @IBOutlet var pageControl : UIPageControl!
    
    @IBOutlet var btnLogin : UIButton!
    @IBOutlet var btnSignUp : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.btnLogin.layer.borderWidth = 1.0
        self.btnLogin.layer.borderColor = UIColor.init(colorLiteralRed: 183.0/255.0, green: 183.0/255.0, blue: 183.0/255.0, alpha: 1.0).cgColor

        self.btnSignUp.layer.borderWidth = 1.0
        self.btnSignUp.layer.borderColor = UIColor.init(colorLiteralRed: 183.0/255.0, green: 183.0/255.0, blue: 183.0/255.0, alpha: 1.0).cgColor
        
        self.scrollView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        let dic1 = ["pic" : "screen1", "text" : "Move 30 minutes or more, Everyday"]
        
        let dic2 = ["pic" : "screen2", "text" : "Move 30 minutes or more, Everyday"]
        
        let dic3 = ["pic" : "screen3", "text" : "Move 30 minutes or more, Everyday"]
        
        let dic4 = ["pic" : "screen4", "text" : "Move 30 minutes or more, Everyday"]
        
        let dic5 = ["pic" : "screen5", "text" : "Move 30 minutes or more, Everyday"]
        
        let arr = [dic1, dic2, dic3, dic4, dic5]
    
        
        self.pageControl?.numberOfPages = arr.count
        
        var int: Int32 = 0
        
        //print("width \(deviceWidth) and height \(deviceHeight)")
        
        for item in arr {
            let imgView = UIImageView.init(frame: CGRect(x:  (CGFloat(int)) * deviceWidth, y: -30, width: deviceWidth, height: deviceHeight+20))
            imgView.image = UIImage.init(named: item["pic"]!)
            imgView.contentMode = UIViewContentMode.scaleAspectFit
            self.vwImages.addSubview(imgView)
            
            let lblText = UILabel.init(frame: CGRect(x: 20+((CGFloat(int)) * deviceWidth), y: deviceHeight - 200, width: deviceWidth - 40, height: 80))
            lblText.numberOfLines = 0
            lblText.textColor = UIColor.white
            lblText.textAlignment = NSTextAlignment.center
            //lblText.backgroundColor = UIColor.red
            
            lblText.font = UIFont(name: "BrandonGrotesque-Medium", size: 24.0) //UIFont.fontNames(forFamilyName: "Brandon_thin.otf")
            lblText.text = item["text"]!
            self.vwImages.addSubview(lblText)
            
            int = int + 1
        }
        
        let width = deviceWidth * (CGFloat)(arr.count)
        
        self.scrollView.contentSize = CGSize(width: width, height: deviceHeight-20)
        self.scrollView.bounces = false
        self.view.bringSubview(toFront: self.pageControl)
        self.scrollView.backgroundColor = UIColor.green
        self.vwImages.backgroundColor = UIColor.brown
    }
    
    internal func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let w = scrollView.bounds.size.width
        
        self.pageControl.currentPage = Int(x/w)
    }
    
    private func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginBtnTapped(_ sender: Any) {
        
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        
    }
    
}

