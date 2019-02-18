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
import CodableFirebase
import SwiftyJSON

class HomeViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tbl_view: UITableView!
    
    
    var ref:DatabaseReference! = nil
    
    var list: Array<Model>!
    
    struct Model: Codable {
        let alpha:  String
        let prefix: String
        let header: String
        let copy:   String
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("HomeViewController.swift - viewDidLoad")
        list = []
        ref = Database.database().reference()
        self.loadData()
    }


    func loadData(){
        ref.observe(.value, with: { snapshot in

            for child in snapshot.children {
                let ar: Array<Model>!
                ar = []
                
                if let snapshot = child as? DataSnapshot {
                    for chld in snapshot.children {
                        
                        if let snpsht = chld as? DataSnapshot {
                            do {
                                let model = try FirebaseDecoder().decode(Model.self, from: snpsht.value as Any)
                                ar.append(model)
                            } catch let error {
                                print(error)
                            }
                        }
                    }
                }
                self.list = ar
                self.tbl_view.reloadData()
            }
        })
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("num items", self.list.count)
        return self.list.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tbl_view.dequeueReusableCell(withIdentifier: "customcell", for: indexPath)
        
        print("--->>>>>>> ",self.list[indexPath.row])
        
        cell.textLabel!.text = self.list[indexPath.row].alpha as? String
        
        return cell
    }
    
}

