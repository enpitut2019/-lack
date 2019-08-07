//
//  RandomViewController.swift
//  shlack
//
//  Created by Itsuki Murayama on 2019/08/06.
//  Copyright © 2019 畑田将太. All rights reserved.
//
import UIKit
import RealmSwift
import AVFoundation

class RandomViewController: UIViewController {
    
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var gameRule: UILabel!
    @IBOutlet weak var gameNumber: UILabel!
    var Numtext: String = "人以上で遊んでね"
    
    let toonPath = Bundle.main.bundleURL.appendingPathComponent("toooon.mp3")
    
    var toonPlayer = AVAudioPlayer()
    
    @IBAction func Return(_ sender: Any) {
        let instance = ViewController()
        let randomGame: Games =  instance.createRandom()
        gameName.text = randomGame.name
        gameRule.text = randomGame.rule
        gameNumber.text = randomGame.number! + Numtext
        //gameNumber.text = String(randomGame.number)
        
        do {
            toonPlayer = try AVAudioPlayer(contentsOf: toonPath, fileTypeHint: nil)
        
            toonPlayer.play()
            }
        catch{
            print("ミストゥぅん")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let instance = ViewController()
        let randomGame: Games =  instance.createRandom()
        gameName.text = randomGame.name
        gameRule.text = randomGame.rule
        gameNumber.text = randomGame.number! + Numtext
        // Do any additional setup after loading the view.
    }
}
