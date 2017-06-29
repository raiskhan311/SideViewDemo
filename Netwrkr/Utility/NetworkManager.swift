//
//  NetworkManager.swift
//  RewinrApp_Swift
//
//  Created by Mohammed Hussain on 26/05/16.
//  Copyright © 2016 Applanche. All rights reserved.
//

import Foundation

class NetworkManager:NSObject {
    
    static let networkManager = NetworkManager()
    private var jsonStrings:String?
//    var constant = Constants()
    
    func executeServiceWithURL(urlString:String,postParameters:NSDictionary?,taskType:TaskType,callback:(_ json:NSDictionary?,_ taskError:NSError?,_ taskType:TaskType)->Void) {
        
        print("URL -: \(urlString)")
        
        do {
            print("Parameters -: \(postParameters!)")
            let json = try JSONSerialization.data(withJSONObject: postParameters!, options: JSONSerialization.WritingOptions.prettyPrinted)
            jsonStrings  = String(data: json,encoding: String.Encoding.utf8)!
            
        } catch let error as NSError {
            print("Error : - \(error.localizedDescription)")
        }
        
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration)
        
        let url = NSURL(string: urlString)
        
        let request = NSMutableURLRequest(url: url! as URL)
        request.httpMethod = "POST"
        request.httpBody = jsonStrings?.data(using: String.Encoding.utf8)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let dataTask = session.dataTask(with: request as URLRequest) { (taskData, taskResponse, taskError) in
            
            do {
                
                let json = try JSONSerialization.jsonObject(with: taskData!, options: .mutableLeaves) as? NSDictionary
                print("JSON :- \(json!)")
                callback(json:json!, taskError:nil, taskType:taskType)
                
            } catch let error as NSError {
                print("Error :- \(error.localizedDescription)")
                callback(json:nil, taskError:error, taskType:taskType)
            }
        }
        dataTask.resume()
    }
    
}
