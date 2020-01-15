//
//  RandomViewController3.swift
//  shlack
//
//  Created by Itsuki Murayama on 2019/08/06.
//  Copyright © 2019 畑田将太. All rights reserved.
//
import UIKit
//import RealmSwift
import AVFoundation

class RandomSecondController: UIViewController {
    var Number: Int = 0
    var audioPlayerInstance : AVAudioPlayer! = nil
    
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var gameNumber: UILabel!
    @IBOutlet weak var gameRule: UILabel!
    @IBOutlet weak var maker: UILabel!
    
    /*let toonPath = Bundle.main.bundleURL.appendingPathComponent("yeah!.mp3")
    
    var toonPlayer = AVAudioPlayer()*/
    
    @IBAction func Return(_ sender: Any) {
        let instance = ViewController()
        var randomGame: Games =  instance.createRandom()
        
        var k: Int = 0
        
        let textNum: String = "人以上で遊んでね！"
        while k == 0 {
            randomGame = instance.createRandom()
            if Int(randomGame.player)! <= Number  {
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
        gameNumber.text = randomGame.player + textNum
        maker.text = randomGame.maker
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /*コールモード*/
        let soundFilePath = Bundle.main.path(forResource: "drink_cole", ofType: "mp3")
        if let soundFilePatha = soundFilePath {
            let sound:URL = URL(fileURLWithPath: soundFilePatha)
            do {
                audioPlayerInstance = try AVAudioPlayer(contentsOf: sound, fileTypeHint:nil)
            } catch {
                print("AVAudioPlayerインスタンス作成でエラー")
            }
            // 再生準備
            audioPlayerInstance.prepareToPlay()
            /*コールモード*/
        }
        
        
        let instance = ViewController()
        var randomGame: Games =  instance.createRandom()
        var k: Int = 0
        
        let textNum: String = "人以上で遊んでね！"
        while k == 0 {
            randomGame = instance.createRandom()
            if Int(randomGame.player)! <= Number  {
                k = 1
            }
        }
        
        gameName.text = randomGame.name
        gameRule.text = randomGame.rule
        gameNumber.text = randomGame.player + textNum
        maker.text = randomGame.maker
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func call(_ sender: UIButton) {
        audioPlayerInstance.currentTime = 0         // 再生箇所を頭に移す
        audioPlayerInstance.play()
    }
}

