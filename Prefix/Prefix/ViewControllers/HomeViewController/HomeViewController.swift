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

class HomeViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tbl_view: UITableView!
    
    var ref:DatabaseReference! = nil // your ref ie. root.child("users").child("stephenwarren001@yahoo.com")
    
    var list: Array<Any>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("HomeViewController.swift - viewDidLoad")
        
//        ref = Database.database().reference()
//
//        let recentPostsQuery = (ref?.child("dictionary").queryLimited(toFirst: 100))!

        
//        print("recentPostsQuery --> ",recentPostsQuery)
        
        
//        ref?.child("dictionary").observeSingleEvent(of: .value, with: { (snapshot) in
//            // Get user value
//            print("Query WORKED !!!!!!!!!!!!!!!!!!!!")
//            let value = snapshot.value as? NSDictionary
//            print("--------------->> ",value as Any)
//            let prefix = value?["prefix"] as? String ?? ""
//            print("prefix --> ",prefix)
//            // ...
//        }) { (error) in
//            print(error.localizedDescription)
//        }
        
        
        
        
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            
            if !snapshot.exists() { return }
            
            print(snapshot.childrenCount)
            print(snapshot.children)
            print(snapshot.value as Any)
            
            // can also use
            // snapshot.childSnapshotForPath("full_name").value as! String
        })

        
        
        
        
        list = ["1","2","3"]
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tbl_view.dequeueReusableCell(withIdentifier: "customcell", for: indexPath)
        
//        cell.textLabel!.text = list[indexPath.row]
        
        return cell
    }
    
//    func testFirebase(){
//        print("testFirebase called")
//        functions.httpsCallable("getFeed").call() { (result, error) in
//            print("Function returned")
//            if let err = error {
//                print("Error -----> ",err)
//            }
//
//            if let res = result {
//                print("Resut -----> ",res)
//            }
//        }
//
//    }
    
}

