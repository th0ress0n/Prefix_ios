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
    
    struct Model: Codable {
        let alpha:  String
        let prefix: String
        let header: String
        let copy:   String
    }
    
    var receiverModel:Model! = nil
    
}
