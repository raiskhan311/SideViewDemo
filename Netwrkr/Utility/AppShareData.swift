//
//  AppShareData.swift
//  RewinrApp_Swift
//
//  Created by Mohammed Hussain on 26/05/16.
//  Copyright © 2016 Applanche. All rights reserved.
//

import UIKit
import Foundation
import AdSupport

class AppShareData:NSObject {
    
    static let sharedInstance = AppShareData()
    let loadingView:LoadingView!
    let constant = Constant()
    
    var loadingViewCount:NSInteger
    var advertisingIdentifier:NSString
    
    override init() {
        loadingView = LoadingView()
        loadingView.frame = UIScreen.mainScreen().bounds
        loadingView.hidden = true
        loadingViewCount = 0
        advertisingIdentifier = ""
    }
    
    func showAlertWithTitle(title:NSString,message:NSString) {
        let alertView = UIAlertView(title: title as String, message: message as String, delegate: nil, cancelButtonTitle:nil, otherButtonTitles:"OK","")
        
        alertView.show()
    }
    
    func showLoadingView() {
        
        loadingViewCount += 1
        if loadingView.hidden == true {
            loadingView.hidden = false
            loadingView.activityIndicator.startAnimating()
            let keyWindow:UIWindow = ((UIApplication.sharedApplication().delegate?.window)!)!
            keyWindow.addSubview(loadingView)
            loadingView.alpha = 0.0
            UIView.animateWithDuration(0.3, animations: {
                self.loadingView.alpha = 0.5
            })
        }
    }
    
    func hideLoadingView() {
        
        loadingViewCount -= 1
        
        if loadingViewCount <= 0 {
            
            if loadingView.hidden == false {
                
                let keyWindow:UIWindow = ((UIApplication.sharedApplication().delegate?.window)!)!
                for view in keyWindow.subviews {
                    
                    if let tempView = view as? LoadingView {
                        
                        UIView.animateWithDuration(0.3, animations: {
                            tempView.alpha = 0.0
                            
                            }, completion: { (finished:Bool) in
                                
                                if finished {
                                    self.loadingViewCount = 0
                                    tempView.hidden = true
                                    tempView.activityIndicator.stopAnimating()
                                }
                        })
                        break
                    }
                }
            }
        }
    }
    
    func identifierForAdverTising()-> NSString? {
        
        if advertisingIdentifier.length == 0 {
            if ASIdentifierManager.sharedManager().advertisingTrackingEnabled {
                
                if let IDFA:NSUUID? = ASIdentifierManager.sharedManager().advertisingIdentifier {
                    advertisingIdentifier = (IDFA?.UUIDString)!
                }
                
            } else {
                advertisingIdentifier = "AdvertisingTrackingDisabled"
            }
        }
        return advertisingIdentifier
    }
    
    func setAppUserId(userId:NSInteger) {
        constant.RWUserDefault.setObject(String(format:"%d",userId), forKey: constant.RWUSERID as String)
    }
    
    func getAppUserId() -> NSString {
        return constant.RWUserDefault.objectForKey(constant.RWUSERID as String) as! (String)
    }
}

