//
//  ViewController.swift
//  shlack
//
//  Created by 畑田将太 on 2019/08/02.
//  Copyright © 2019 畑田将太. All rights reserved.
//

import UIKit
import RealmSwift

//game名を格納する配列
//var gamelist: Results<Games>?
//Realmのインスタンスを初期化
//var realm : Realm? = nil

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    
    var selectedName: String?
    var selectedRule: String?
    var selected1to3: Int = 0
    var selected4to6: Int = 0
    var selectedOver7: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        
        let tblBackColor: UIColor = UIColor.clear
        table.backgroundColor = tblBackColor
        //tableCell.backgroundColor = tblBackColor
        //realm  = try! Realm();
        //gamelist = realm!.objects(Games.self)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //戻り値の設定(表示するcell数)
        return gamelist?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //変数を作る
        let game : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "game", for: indexPath)
        //取得したgameからn番目を変数に代入
        
        let item: Games = gamelist![(indexPath as NSIndexPath).row]
        //let item: Games = gamelist![indexPath.row]
        
        //変数の中身を作る
        game.textLabel!.text = item.name
        //戻り値の設定（表示する中身)
        return game
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)番目の行が選択されました。")
        selectedName = gamelist?[indexPath.row].name
        selectedRule = gamelist?[indexPath.row].rule
        selected1to3 = (gamelist?[indexPath.row].number1to3)!
        selected4to6 = (gamelist?[indexPath.row].number4to6)!
        selectedOver7 = (gamelist?[indexPath.row].numberOver7)!
        
        table.deselectRow(at: indexPath, animated: true)
        // 別の画面に遷移
        performSegue(withIdentifier: "showSecondView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showSecondView") {
            let secondVC: SecondViewController = (segue.destination as? SecondViewController)!
            
            // 11. SecondViewControllerのtextに選択した文字列を設定する
            secondVC.Name = selectedName
            secondVC.Rule = selectedRule
            secondVC.N1to3 = selected1to3
            secondVC.N4to6 = selected4to6
            secondVC.N7 = selectedOver7
        }
    }
    
    func createRandom()-> Games {
        let n = gamelist?.count
        print(gamelist)
        let rdm = Int.random(in: 0..<(n)!)
        return gamelist![rdm]
    }

}

