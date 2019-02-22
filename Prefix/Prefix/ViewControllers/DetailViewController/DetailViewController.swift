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
    
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var prefixLabel: UILabel!
    @IBOutlet weak var detailHeader: UILabel!
    @IBOutlet weak var detailCopy: UILabel!
    
    var pItem: PrefixItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.alphaLabel.text = pItem?.alpha.uppercased()
        self.prefixLabel.text = pItem?.prefix
        self.detailHeader.text = pItem?.header
        self.detailCopy.text = pItem?.copy
        
    }
    
}
