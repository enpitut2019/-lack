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
    var RandomList: Results<Games>?
    
    @IBOutlet weak var textNumber: UITextField!
    
    var numberText: String? = nil
    
    override func viewDidLoad() {
        self.textNumber.keyboardType = UIKeyboardType.numberPad
       /* if numberText != "" {
            RandomList = realm!.objects(Games.self).filter("number == $1", Int(numberText!)!)
        }*/
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showRandomView") {
            if textNumber.text != "" && Int(textNumber.text!)! != 0 {
            numberText = textNumber.text
            }
            else {
                numberText = "1"
            }
            let SecondVC: RandomSecondController = (segue.destination as? RandomSecondController)!
            SecondVC.Number = Int(numberText!)!
        }
        else {
            let alert = UIAlertController(title: "検索できません", message: "数字を入力して下さい", preferredStyle: UIAlertController.Style.alert)
            let okayButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(okayButton)
        }
    }
}
