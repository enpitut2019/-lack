//
//  AddViewController.swift
//  shlack
//
//  Created by Itsuki Murayama on 2019/08/05.
//  Copyright © 2019 畑田将太. All rights reserved.
//
import UIKit
import RealmSwift

class AddViewController: UIViewController {

    var s1 = 0
    var s2 = 0
    var s3 = 0
    
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textRule: UITextView!
    @IBAction func switch1to3(_ sender: Any) {
        s1 = (sender as AnyObject).isOn ? 1:0
        print(s1)
    }
    @IBAction func switch4to6(_ sender: Any) {
        s2 = (sender as AnyObject).isOn ? 1:0
        print(s2)
    }
    @IBAction func switchOver7(_ sender: Any) {
        s3 = (sender as AnyObject).isOn ? 1:0
        print(s3)
    }
    
    
    @IBAction func tapAddButton(_ sender: Any) {
        if (textName.text != "" && textRule.text != "" && s1+s2+s3 != 0){
        let game = Games()
        game.name = textName.text
        
        game.rule = textRule.text
        
        game.number1to3 = s1
        game.number4to6 = s2
        game.numberOver7 = s3

        game.save()
            
            let title = "追加できました"
            let message = "HOMEに戻りますか？"
            let NoText = "NO"
            
            let NoButton = UIAlertAction(title: NoText, style: UIAlertAction.Style.cancel, handler: nil)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{(action: UIAlertAction!) in
                
                //アラートが消えるのと画面遷移が重ならないように0.5秒後に画面遷移するようにしてる
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    // 0.5秒後に実行したい処理
                    self.performSegue(withIdentifier: "AddSuccess", sender: nil)
                }
            }
            )
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            
            present(alert, animated: true, completion: nil)
            alert.addAction(NoButton)
            alert.addAction(okAction)
        }
        
        else{
            let title = "追加できませんでした"
            var message = ""
            if(s1==0&&s2==0&&s3==0){
                message = "０人じゃ遊べないじゃん。。。"
            }
            else{
                message = "名前とルールの両方とも入力してください"
            }
            let okText = "OK"
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            let okayButton = UIAlertAction(title: okText, style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(okayButton)
            
            present(alert, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
    }
}
