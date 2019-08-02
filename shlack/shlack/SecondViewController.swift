//
//  SecondViewController.swift
//  shlack
//
//  Created by Itsuki Murayama on 2019/08/02.
//  Copyright © 2019 畑田将太. All rights reserved.
//

import UIKit
import RealmSwift

class SecondViewController: UIViewController {
    var textL: String?
    
    override func viewDidLoad() {
       super.viewDidLoad()
        
        print(textL!)
        
        let label = UILabel()
        label.text = textL
        label.sizeToFit()
        label.center = self.view.center
        self.view.addSubview(label)
     //label.text = text
    }
}
