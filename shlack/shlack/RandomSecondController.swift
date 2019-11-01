//
//  RandomViewController3.swift
//  shlack
//
//  Created by Itsuki Murayama on 2019/08/06.
//  Copyright © 2019 畑田将太. All rights reserved.
//
import UIKit
import RealmSwift
import AVFoundation

class RandomSecondController: UIViewController {
    var Number: Int = 0
    
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var gameNumber: UILabel!
    @IBOutlet weak var gameRule: UILabel!
    
    /*let toonPath = Bundle.main.bundleURL.appendingPathComponent("yeah!.mp3")
    
    var toonPlayer = AVAudioPlayer()*/
    
    @IBAction func Return(_ sender: Any) {
        let instance = ViewController()
        var randomGame: Games =  instance.createRandom()
        
        var k: Int = 0
        
        let textNum: String = "人以上で遊んでね！"
        while k == 0 {
            randomGame = instance.createRandom()
            if Int(randomGame.number!)! <= Number  {
                k = 1
            }
        }
        
        /*do {
            toonPlayer = try AVAudioPlayer(contentsOf: toonPath, fileTypeHint: nil)
            
            toonPlayer.play()
        }
        catch{
            print("ミストゥぅん")
        }*/

        gameName.text = randomGame.name
        gameRule.text = randomGame.rule
        gameNumber.text = randomGame.number! + textNum
        //gameNumber.text = String(randomGame.number)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let instance = ViewController()
        var randomGame: Games =  instance.createRandom()
        var k: Int = 0
        
        let textNum: String = "人以上で遊んでね！"
        while k == 0 {
            randomGame = instance.createRandom()
            if Int(randomGame.number!)! <= Number  {
                k = 1
            }
        }
        
        gameName.text = randomGame.name
        gameRule.text = randomGame.rule
        gameNumber.text = randomGame.number! + textNum
        //gameNumber.text = String(randomGame.number)
        // Do any additional setup after loading the view.
    }
}
