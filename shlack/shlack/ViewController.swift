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

    var selectedName: String?
    var selectedRule: String?
    

    /*@IBAction func tapAddButton(_ sender: Any) {
        //アラートダイアログを生成
        let alertController = UIAlertController(title: "ゲームの追加", message: nil, preferredStyle: UIAlertController.Style.alert)
        
        //テキストエリアを追加
        alertController.addTextField { (gametext: UITextField!) -> Void in gametext.placeholder = "ゲーム名"}
        alertController.addTextField { (ruletext: UITextField!) -> Void in ruletext.placeholder = "ルール"}
        
        //追加ボタンを追加
        let sendAction = UIAlertAction(title: "追加", style: UIAlertAction.Style.default){
            (ACTION: UIAlertAction) in
            if let gametext = alertController.textFields?[0].text! {
                
                //入力値をデータベースに格納
                let game = Games()
                game.name = gametext
                
                if let ruletext = alertController.textFields?[1].text! {
                    game.rule = ruletext
                }
                game.save()
                
                //self.gamelist = self.realm!.objects(Games.self)
                
                /*//配列に入力値を挿入。戦闘に挿入
                self.gamelist.insert(gametext.text!, at: 0)*/
                
                //テーブルに行が追加されたことをテーブルに通知
                self.table.beginUpdates()
                self.table.insertRows(at: [IndexPath(row: self.gamelist!.count-1, section: 0)], with: UITableView.RowAnimation.right)
                self.table.endUpdates()
            }
        }
        //追加ボタンがタップされたときの処理
        alertController.addAction(sendAction)
        
        //アラートダイアログを表示
        present(alertController, animated: true, completion: nil)
    }
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//
//    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        
        realm  = try! Realm();
        self.gamelist = self.realm!.objects(Games.self)
        
    }
    
    //game名を格納する配列
    var gamelist: Results<Games>?
    
    //Realmのインスタンスを初期化
    var realm : Realm? = nil // = try! Realm()
    
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
            
            print("デリ")
        }
    }


}

