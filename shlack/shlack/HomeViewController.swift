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
import GoogleSignIn

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

class HomeViewController: UIViewController, GIDSignInUIDelegate {

    @IBOutlet weak var toRandom2: UIButton!
    @IBOutlet weak var all: UIButton!
    @IBOutlet weak var add: UIButton!
    
    // ログアウトボタン
    @IBAction func logoutButton(_ sender: Any) {
        do {
          try Auth.auth().signOut()
          self.performSegue(withIdentifier: "toLogout", sender: nil)
          print("てゅうん")


        } catch _ as NSError {
            print ("ちゅうえい")
        }
    }
    
    let screenWidth = Int( UIScreen.main.bounds.size.width);
    
    //スクリーンの高さ
    let screenHeight = Int(UIScreen.main.bounds.size.height);
    
    //CGRectで取得
    let rect = UIScreen.main.bounds;

    
    /*let toonPath = Bundle.main.bundleURL.appendingPathComponent("はとぅーーん.m4a")
    
    var toonPlayer = AVAudioPlayer()*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
            
        guard let authentication = user.authentication else { return }
        
        _ = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                              accessToken: authentication.accessToken)

        }
        
        // DB接続の初期化
               DBRef = Database.database().reference()
        
        // realtime databaseとの同期(無理やりだから要リファクタリング) MyTable
        DBRef.child("games").observeSingleEvent(of: .value, with: { (snapshot) in
            gamelist.removeAll()
            for user in (snapshot.children) {
                let uid = user as! DataSnapshot
                for game in (uid.children){
                    let gid = game as! DataSnapshot
                    let dic = gid.value as! NSDictionary
                        gamelist.append(Games(id: dic["id"] as! String, name: dic["name"] as! String, rule: dic["rule"] as! String, player: dic["player"] as! String))
                    }
                }
            }
        )
        
        if let newuid = uid {
        DBRef.child("games").child(newuid).observeSingleEvent(of: .value, with: { (snapshot) in
             mygamelist.removeAll()
                   for item in (snapshot.children) {
                    let gid = item as! DataSnapshot
                    let dic = gid.value as! NSDictionary
                       mygamelist.append(Games(id: dic["id"] as! String, name: dic["name"] as! String, rule: dic["rule"] as! String, player: dic["player"] as! String))
                   }
        })
        }

        
        self.toRandom2.frame.origin.x = CGFloat(screenWidth/10)
        self.toRandom2.frame.origin.y = CGFloat(screenHeight*3/5)
        self.toRandom2.frame.size.width = CGFloat(screenWidth*4/5)
        self.toRandom2.frame.size.height = CGFloat(screenHeight/7)
        
//        self.all.frame.origin.x = CGFloat(screenWidth/10)
//        self.all.frame.origin.y = CGFloat(screenHeight*27/35)
//        self.all.frame.size.width = CGFloat(screenWidth*3/8)
//        self.all.frame.size.height = CGFloat(screenHeight/9)
        
//        self.add.frame.origin.x = CGFloat(screenWidth/10 + screenWidth*4/5 - screenWidth*3/8)
//        self.add.frame.origin.y = CGFloat(screenHeight*27/35)
//        self.add.frame.size.width = CGFloat(screenWidth*3/8)
//        self.add.frame.size.height = CGFloat(screenHeight/9)

    }
}



