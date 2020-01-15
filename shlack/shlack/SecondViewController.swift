//
//  SencondViewController.swift
//  shlack
//
//  Created by 上嶋大貴 on 2019/08/05.
//  Copyright © 2019 畑田将太. All rights reserved.
//

import UIKit
import RealmSwift

class SecondViewController: UIViewController {
    var Name: String?
    var Rule: String?
    var Number: String?
    var Maker: String?
    var Numtext: String = "人以上で遊んでね"
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label2: UITextView!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label_maker: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = Name
        label2.text = Rule
        label3.text = Number! + Numtext
        label_maker.text = Maker
    }
}
