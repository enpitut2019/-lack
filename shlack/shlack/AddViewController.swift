//
//  AddViewController.swift
//  shlack
//
//  Created by Itsuki Murayama on 2019/08/05.
//  Copyright © 2019 畑田将太. All rights reserved.
//
import UIKit
import Firebase
import FirebaseDatabase

class AddViewController: UIViewController {
    
    //オートレイアウト用に接続を追加　11/20

    
    @IBOutlet weak var Bar: UINavigationBar!
    @IBOutlet weak var descriptName: UILabel!
    @IBOutlet weak var descriptRule: UILabel!
    @IBOutlet weak var descriptNumber: UILabel!
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textRule: UITextView!
    @IBOutlet weak var textNumber: UITextField!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelRule: UILabel!
    @IBOutlet weak var labelNumber: UILabel!
    
    let screenWidth = Int( UIScreen.main.bounds.size.width);
    
    //スクリーンの高さ
    let screenHeight = Int(UIScreen.main.bounds.size.height);
    
    //CGRectで取得
    let rect = UIScreen.main.bounds;
    
    
    @IBAction func tapAddButton(_ sender: Any) {
        if (textName.text != "" && textRule.text != "" && textNumber.text != "" && Int(textNumber.text!)! != 0){
        /*11/22マージの影法師
             let game = Games()
        game.name = textName.text
        
        game.rule = textRule.text
        
        game.number = textNumber.text

        game.save()*/
            
            let key = DBRef.child("games").childByAutoId().key
            //            let key = UUID().uuidString
                        let game = [
                            "id": key,
                            "name": textName.text,
                            "rule": textRule.text,
                            "player": textNumber.text
                            ]
                        let newGame = ["/games/\(key)/": game]
                        DBRef.updateChildValues(newGame)
            
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
            if textNumber.text == "" {
                message = "人数を選択して下さい"
            }
            else if (Int(textNumber.text!)! == 0){
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
        self.textNumber.keyboardType = UIKeyboardType.numberPad
        
        self.descriptName.font = descriptName.font.withSize(CGFloat(screenWidth/20))
        self.descriptName.frame = CGRect(x:screenWidth/30, y:Int(self.Bar.frame.origin.y + self.Bar.frame.size.height) + screenWidth/50, width:screenWidth*12/20, height:screenWidth/20)
        
        self.labelName.font = labelName.font.withSize(CGFloat(screenWidth/15))
        self.labelName.frame = CGRect(x:screenWidth/30, y:Int(self.descriptName.frame.origin.y + self.descriptName.frame.size.height) + screenWidth/50, width:screenWidth*4/15, height:screenWidth/15)
        
        self.textName.frame = CGRect(x:Int(self.labelName.frame.origin.x + self.labelName.frame.size.width), y:Int(self.descriptName.frame.origin.y + self.descriptName.frame.size.height) + screenWidth/50, width:screenWidth*4/15, height:screenWidth/15)
        
        // ステータスバーを非表示にする
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
