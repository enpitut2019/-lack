//
//  RandomViewController2.swift
//  shlack
//
//  Created by Itsuki Murayama on 2019/08/06.
//  Copyright © 2019 畑田将太. All rights reserved.
//

import UIKit
import RealmSwift

class RandomSelectController: UIViewController {
    @IBOutlet weak var textNumber: UITextField!
    
    var number: Int = 0
    
    override func viewDidLoad() {
        self.textNumber.keyboardType = UIKeyboardType.numberPad
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showRandomView") {
            number = Int(textNumber.text!)!
            let SecondVC: RandomSecondController = (segue.destination as? RandomSecondController)!
            SecondVC.Number = number
        }
        else {
            let alert = UIAlertController(title: "検索できません", message: "数字を入力して下さい", preferredStyle: UIAlertController.Style.alert)
            let okayButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(okayButton)
        }
    }
}
