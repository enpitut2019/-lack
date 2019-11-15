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
    @IBOutlet weak var gameRule: UITextView!
    @IBOutlet weak var gameNumber: UILabel!
    var Numtext: String = "人以上で遊んでね"
    
    /*let toonPath = Bundle.main.bundleURL.appendingPathComponent("toooon.mp3")
    
    var toonPlayer = AVAudioPlayer()*/
    
    @IBAction func Return(_ sender: Any) {
        let instance = ViewController()
        let randomGame: Games =  instance.createRandom()
        gameName.text = randomGame.name
        gameRule.text = randomGame.rule
        gameNumber.text = randomGame.number! + Numtext
        //gameNumber.text = String(randomGame.number)
        
        /*do {
            toonPlayer = try AVAudioPlayer(contentsOf: toonPath, fileTypeHint: nil)
        
            toonPlayer.play()
            }
        catch{
            print("ミストゥぅん")
        }*/
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let instance = ViewController()
        let randomGame: Games =  instance.createRandom()
        let screenWidth = Double(UIScreen.main.bounds.size.width);
        gameName.text = randomGame.name
        gameName.font = gameName.font.withSize(CGFloat(screenWidth*0.1))
        gameRule.text = randomGame.rule
        gameNumber.text = randomGame.number! + Numtext
        gameNumber.font = gameNumber.font.withSize(CGFloat(screenWidth*0.06))
        gameRule.font = gameNumber.font
        // Do any additional setup after loading the view.
    }
}
