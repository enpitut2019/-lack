//
//  HomeViewController.swift
//  shlack
//
//  Created by Itsuki Murayama on 2019/08/05.
//  Copyright © 2019 畑田将太. All rights reserved.
//
import UIKit
import RealmSwift
import AVFoundation

//game名を格納する配列
var gamelist: Results<Games>?
//Realmのインスタンスを初期化
var realm : Realm? = nil

class HomeViewController: UIViewController {
    @IBOutlet weak var toRandom: UIButton!
    
    let toonPath = Bundle.main.bundleURL.appendingPathComponent("pudding.mp3")
    
    var toonPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        realm  = try! Realm();
        gamelist = realm!.objects(Games.self)
        
        self.toRandom.layer.cornerRadius = 30
        self.toRandom.layer.borderColor = UIColor.red.cgColor
        self.toRandom.layer.borderWidth = 10
        
            do {
                toonPlayer = try AVAudioPlayer(contentsOf: toonPath, fileTypeHint: nil)
                
                toonPlayer.play()
            }
            catch{
                print("ミストゥぅん")
            }
        /*let sample = Games()
        try! realm?.write{
            sample.name = "サンプル"
            sample.rule = "ここにルールを打ち込みます"
            sample.number = "0"
            realm?.add(sample)
 }*/
    }
}
