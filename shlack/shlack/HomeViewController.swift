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
import Firebase
import FirebaseDatabase

// ゲームデータ用構造体
struct Games {
    var id: String
    var name: String
    var rule: String
    var player: String
    
    init(id: String, name: String, rule: String, player: String){
        self.id = id
        self.name = name
        self.rule = rule
        self.player = player
    }
}

// Gamesを格納する配列
var gamelist = [Games]()

// realtime databaseとの接続設定
var DBRef: DatabaseReference!


class HomeViewController: UIViewController {

    @IBOutlet weak var toRandom: UIButton!
    @IBOutlet weak var toRandom2: UIButton!
    @IBOutlet weak var all: UIButton!
    @IBOutlet weak var add: UIButton!
    
    let screenWidth = Int( UIScreen.main.bounds.size.width);
    
    //スクリーンの高さ
    let screenHeight = Int(UIScreen.main.bounds.size.height);
    
    //CGRectで取得
    let rect = UIScreen.main.bounds;

    
    /*let toonPath = Bundle.main.bundleURL.appendingPathComponent("はとぅーーん.m4a")
    
    var toonPlayer = AVAudioPlayer()*/
    
    override func viewDidLoad() {
        // DB接続の初期化
        DBRef = Database.database().reference()
        
        // realtime databaseとの同期
        DBRef.child("games").observeSingleEvent(of: .value, with: { (snapshot) in
            for item in (snapshot.children) {
                let child = item as! DataSnapshot
                let dic = child.value as! NSDictionary
                gamelist.append(Games(id: dic["id"] as! String, name: dic["name"] as! String, rule: dic["rule"] as! String, player: dic["player"] as! String))
            }
        })
        
        
        self.toRandom.frame.origin.x = CGFloat(screenWidth/10)
        self.toRandom.frame.origin.y = CGFloat(screenHeight*9/16)
        self.toRandom.frame.size.width = CGFloat(screenWidth*4/5)
        self.toRandom.frame.size.height = CGFloat(screenHeight/9)
        self.toRandom.titleLabel?.font = UIFont.systemFont(ofSize: self.toRandom.frame.size.height/3)
        
        self.toRandom2.frame.origin.x = CGFloat(screenWidth/10)
        self.toRandom2.frame.origin.y = CGFloat(screenHeight*33/48)
        self.toRandom2.frame.size.width = CGFloat(screenWidth*4/5)
        self.toRandom2.frame.size.height = CGFloat(screenHeight/9)
        self.toRandom2.titleLabel?.font = UIFont.systemFont(ofSize: self.toRandom.frame.size.height/3)
        
        self.all.frame.origin.x = CGFloat(screenWidth/10)
        self.all.frame.origin.y = CGFloat(screenHeight*39/48)
        self.all.frame.size.width = CGFloat(screenWidth*3/8)
        self.all.frame.size.height = CGFloat(screenHeight/9)
        self.all.titleLabel?.font = UIFont.systemFont(ofSize: self.toRandom.frame.size.height/3)
        
        self.add.frame.origin.x = CGFloat(screenWidth/10 + screenWidth*4/5 - screenWidth*3/8)
        self.add.frame.origin.y = CGFloat(screenHeight*39/48)
        self.add.frame.size.width = CGFloat(screenWidth*3/8)
        self.add.frame.size.height = CGFloat(screenHeight/9)
        self.add.titleLabel?.font = UIFont.systemFont(ofSize: self.toRandom.frame.size.height/3)
        
        print(UIDevice.current.name)
        
        
           /*do {
                toonPlayer = try AVAudioPlayer(contentsOf: toonPath, fileTypeHint: nil)
                
                toonPlayer.play()
            }
            catch{
                print("ミストゥぅん")
            }*/
        
        /*let sample = Games()
        try! realm?.write{
            sample.name = "サンプル"
            sample.rule = "ここにルールを打ち込みます"
            sample.number = "0"
            realm?.add(sample)
 }*/
    }
}
