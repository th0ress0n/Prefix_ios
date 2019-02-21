//
//  DetailViewController.swift
//  Prefix
//
//  Created by per thoresson on 2/19/19.
//  Copyright © 2019 per thoresson. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFunctions
import CodableFirebase
import SwiftyJSON


class DetailViewController: UIViewController {
    
    var pItem: PrefixItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let value = pItem?.alpha // this should work fine here
        print("----->>>> ",value)
    }
    
}
