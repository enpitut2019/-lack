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
    var N1to3: Int = 0
    var N4to6: Int = 0
    var N7: Int = 0
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label2: UITextView!
    @IBOutlet weak var label3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*let label = UILabel()
        label.text = textL
        label.font = label.font.withSize(50)
        label.sizeToFit()
        self.view.addSubview(label)
        label.center = self.view.center*/
        label.text = Name
        label2.text = Rule
        if N1to3 == 1 {
            if N4to6 == 1{
                if N7 == 1{
                    label3.text = "何人でも遊べるよ！"
                }
                else {
                    label3.text = "1~6人で遊んでね！"
                }
            }
            else {
                label3.text = "1~3人で遊んでね！"
            }
        }
        else if N4to6 == 1{
            if N7 == 1{
                label3.text = "4人以上で遊んでね！"
            }
            else{
                label3.text = "4~6人で遊んでね！"
            }
        }
        else {
            label3.text = "7人以上で遊んでね！"
        }
    }
}
