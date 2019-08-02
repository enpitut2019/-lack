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
        label.font = label.font.withSize(50)
        label.sizeToFit()
        self.view.addSubview(label)
        label.center = self.view.center
     //label.text = text
    }
}
