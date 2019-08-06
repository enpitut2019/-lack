//
//  RandomViewController.swift
//  shlack
//
//  Created by Itsuki Murayama on 2019/08/06.
//  Copyright © 2019 畑田将太. All rights reserved.
//
import UIKit
import RealmSwift

class RandomViewController: UIViewController {
    
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var gameRule: UILabel!
    
    
    @IBAction func Return(_ sender: Any) {
        let instance = ViewController()
        let randomGame: Games =  instance.createRandom()
        gameName.text = randomGame.name
        gameRule.text = randomGame.rule
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let instance = ViewController()
        let randomGame: Games =  instance.createRandom()
        gameName.text = randomGame.name
        gameRule.text = randomGame.rule
        // Do any additional setup after loading the view.
    }
}
