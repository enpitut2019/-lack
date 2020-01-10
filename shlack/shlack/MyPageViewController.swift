//
//  MyPageViewController.swift
//  shlack
//
//  Created by 丸田 on 2020/01/08.
//  Copyright © 2020 畑田将太. All rights reserved.
//

import UIKit
import RealmSwift
import Firebase
import FirebaseDatabase

class MyPageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var mytable: UITableView!
    
    
    var selectedName: String?
    var selectedRule: String?
    var selectedNum: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mytable.delegate = self
        mytable.dataSource = self
        
        let tblBackColor: UIColor = UIColor.clear
        mytable.backgroundColor = tblBackColor
        
        // DB接続の初期化
        DBRef = Database.database().reference()
        
        DBRef.child("games").child("\(String(describing: uid))").observeSingleEvent(of: .value, with: { (snapshot) in
                   for item in (snapshot.children) {
                    let gid = item as! DataSnapshot
                    let dic = gid.value as! NSDictionary
                       gamelist.append(Games(id: dic["id"] as! String, name: dic["name"] as! String, rule: dic["rule"] as! String, player: dic["player"] as! String))
                   }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //戻り値の設定(表示するcell数)
        return gamelist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //変数を作る
        let game : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "game", for: indexPath)
        //取得したgameからn番目を変数に代入
        let grayClor = UIColor.white.withAlphaComponent(0.50)
        game.backgroundColor = grayClor
        
        let item: Games = gamelist[(indexPath as NSIndexPath).row]
        //let item: Games = gamelist![indexPath.row]
        
        //変数の中身を作る
        game.textLabel!.text = item.name
        //戻り値の設定（表示する中身)
        return game
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)番目の行が選択されました。")
        selectedName = gamelist[indexPath.row].name
        selectedRule = gamelist[indexPath.row].rule
        selectedNum = gamelist[indexPath.row].player
        
        mytable.deselectRow(at: indexPath, animated: true)
        // 別の画面に遷移
        performSegue(withIdentifier: "showSecondView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showSecondView") {
            let secondVC: SecondViewController = (segue.destination as? SecondViewController)!
            
            // 11. SecondViewControllerのtextに選択した文字列を設定する
            secondVC.Name = selectedName
            secondVC.Rule = selectedRule
            secondVC.Number = selectedNum
        }
    }
    
    func createRandom()-> Games {
        let n = gamelist.count
        let rdm = Int.random(in: 0..<(n))
        return gamelist[rdm]
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //テーブルの削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            DBRef.child("games").child("\(gamelist[indexPath.row].id)").removeValue()
            gamelist.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }

}
