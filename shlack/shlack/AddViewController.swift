//
//  AddViewController.swift
//  shlack
//
//  Created by Itsuki Murayama on 2019/08/05.
//  Copyright © 2019 畑田将太. All rights reserved.
//
import UIKit
import RealmSwift

class AddViewController: UIViewController {

    
    
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textRule: UITextView!
    @IBAction func tapAddButton(_ sender: Any) {
        let game = Games()
        game.name = textName.text
        
        game.rule = textRule.text
        game.save()
    }
    override func viewDidLoad() {
    }
}
