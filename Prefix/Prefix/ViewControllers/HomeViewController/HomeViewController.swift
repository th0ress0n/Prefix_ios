//
//  HomeViewController.swift
//  Prefix
//
//  Created by per thoresson on 1/30/19.
//  Copyright © 2019 per thoresson. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFunctions
import SwiftyJSON

class HomeViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tbl_view: UITableView!
    
    var ref:DatabaseReference! = nil // your ref ie. root.child("users").child("stephenwarren001@yahoo.com")
    
    var list: Array<Any>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("HomeViewController.swift - viewDidLoad")
        
        list = ["1","2","3"]
        self.readJson()
    }
    
    private func readJson() {
        
        do {
            if let file = Bundle.main.url(forResource: "feed", withExtension: "json") {
                let data = try Data(contentsOf: file)
                
                
//                 let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                
                let json = JSON(data)
                
                
//                let sortedArray = json.sorted { $0["alpha"]! < $1["alpha"]! }
                
                
                for (key,subJson):(String, JSON) in json {
                    // Do something you want
                    print(key," <> ",subJson)
                    self.list.append(subJson)
                }
            
                
                for item in self.list {
                    print(item," --->>> ",JSON(item)["alpha"])
                }

                
//                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
//
//                if let object = json as? [String: Any] {
//                    // json is a dictionary
//                    print("Dict -> ",object)
//
//                    for (key, value) in object {
//                        print(key," -> value = JSON -> ",value)
//                        self.list.append(value)
//                    }
//
//
//
////                    self.list = Array(object.keys)
//
//                } else if let object = json as? [Any] {
//                    // json is an array
//                    print("Array -> ",object)
//                } else {
//                    print("JSON is invalid")
//                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("num items", self.list.count)
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tbl_view.dequeueReusableCell(withIdentifier: "customcell", for: indexPath)
        
        print("--->>>>>>> ",self.list[indexPath.row])
        
        cell.textLabel!.text = self.list[indexPath.row] as? String
        
        return cell
    }
    
}

