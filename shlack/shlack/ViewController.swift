//
//  ViewController.swift
//  shlack
//
//  Created by 畑田将太 on 2019/08/02.
//  Copyright © 2019 畑田将太. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self 
        table.dataSource = self
        
        /*
         let game1 = Gamemodel()
         game1.name = "山の手ゲーム"
         game1.rule = "適当に"
         
         let game2 = Gamemodel()
         game2.name = "ピンポンパンゲーム"
         game2.rule = "指差す"
         */
        gamelist.append("山手線ゲーム")
        gamelist.append("ピンポンパンゲーム")
        gamelist.append("ファイヤゲーム")
        gamelist.append("マンションゲーム")
        gamelist.append("スーパマリオゲーム")
        gamelist.append("名探偵コナンゲーム")
        gamelist.append("歌歌えゲーム")
        gamelist.append("ほうれん草ゲーム")
    }
    
    //game名を格納する配列
    var gamelist = [String]()
    
    let realm = try! Realm()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //戻り値の設定(表示するcell数)
        return gamelist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //変数を作る
        let game : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "game", for: indexPath)
        //変数の中身を作る
        game.textLabel!.text = gamelist[indexPath.row]
        //戻り値の設定（表示する中身)
        return game
    }


}

