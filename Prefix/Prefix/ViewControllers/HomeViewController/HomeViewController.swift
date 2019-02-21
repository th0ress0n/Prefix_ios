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

struct PrefixItem: Codable {
    let alpha:  String
    let prefix: String
    let header: String
    let copy:   String
}


class HomeViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tbl_view: UITableView!
    
    var pItem: PrefixItem?
    
    var ref:DatabaseReference! = nil
    
    var list: Array<PrefixItem>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tbl_view.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        self.tbl_view.separatorColor = UIColor.white

        list = []
        ref = Database.database().reference()
        self.loadData()
    }


    func loadData(){
        ref.observe(.value, with: { snapshot in

            for child in snapshot.children {
                let ar: Array<PrefixItem>!
                ar = []
                
                if let snapshot = child as? DataSnapshot {
                    for chld in snapshot.children {
                        
                        if let snpsht = chld as? DataSnapshot {
                            do {
                                let model = try FirebaseDecoder().decode(PrefixItem.self, from: snpsht.value as Any)
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
        cell.separatorInset = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 20)
        cell.textLabel!.text = self.list[indexPath.row].header
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        let rowID = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath)
        print(rowID as Any," <==> ",indexPath," <==> ",currentCell as Any)
        
        // create the object to pass
        // detailObj = <FIX = Get Model used for list item>
        // setup segue
        
        print("IS THIS THE RIGHT ONE? ",self.list[indexPath.row].header)
        
        self.pItem = self.list[indexPath.row]
        
        self.performSegue(withIdentifier: "segueToDetail", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.pItem = self.pItem
        }
    }
    
}

