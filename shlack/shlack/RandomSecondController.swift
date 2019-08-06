//
//  RandomViewController3.swift
//  shlack
//
//  Created by Itsuki Murayama on 2019/08/06.
//  Copyright © 2019 畑田将太. All rights reserved.
//
import UIKit
import RealmSwift

class RandomSecondController: UIViewController {
    var Number: Int = 0
    
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var gameNumber: UILabel!
    @IBOutlet weak var gameRule: UILabel!
    
    @IBAction func Return(_ sender: Any) {
        let instance = ViewController()
        var randomGame: Games =  instance.createRandom()
        
        var k: Int = 0
        
        while k == 0 {
            randomGame = instance.createRandom()
            if Number <= 3 && randomGame.number1to3 == 1 {
                print("number1to3")
                k = 1
            }
            else if 3 < Number && Number <= 6 && randomGame.number4to6 == 1 {
                print("number4to6")
                k = 1
            }
            else if 6 < Number && randomGame.numberOver7 == 1 {
                print("numberOver7")
                k = 1
            }
        }

        gameName.text = randomGame.name
        gameRule.text = randomGame.rule
        
        if randomGame.number1to3 == 1 {
            if randomGame.number4to6 == 1{
                if randomGame.numberOver7 == 1{
                    gameNumber.text = "何人でも遊べるよ！"
                }
                else {
                    gameNumber.text = "1~6人で遊んでね！"
                }
            }
            else if randomGame.numberOver7 == 1{
                gameNumber.text = "1~3人か７人以上で遊んでね！（？）"
            }
            else {
                gameNumber.text = "1~3人で遊んでね！"
            }
        }
        else if randomGame.number4to6 == 1{
            if randomGame.numberOver7 == 1{
                gameNumber.text = "4人以上で遊んでね！"
            }
            else{
                gameNumber.text = "4~6人で遊んでね！"
            }
        }
        else {
            gameNumber.text = "7人以上で遊んでね！"
        }
        //gameNumber.text = String(randomGame.number)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let instance = ViewController()
        var randomGame: Games =  instance.createRandom()
        var k: Int = 0
        
        while k == 0 {
            randomGame =  instance.createRandom()
            if Number <= 3 && randomGame.number1to3 == 1 {
                k = 1
            }
            else if 3 < Number && Number <= 6 && randomGame.number4to6 == 1 {
                k = 1
            }
            else if 6 < Number && randomGame.numberOver7 == 1 {
                k = 1
            }
        }
        
        gameName.text = randomGame.name
        gameRule.text = randomGame.rule
        if randomGame.number1to3 == 1 {
            if randomGame.number4to6 == 1{
                if randomGame.numberOver7 == 1{
                    gameNumber.text = "何人でも遊べるよ！"
                }
                else {
                    gameNumber.text = "1~6人で遊んでね！"
                }
            }
            else {
                gameNumber.text = "1~3人で遊んでね！"
            }
        }
        else if randomGame.number4to6 == 1{
            if randomGame.numberOver7 == 1{
                gameNumber.text = "4人以上で遊んでね！"
            }
            else{
                gameNumber.text = "4~6人で遊んでね！"
            }
        }
        else {
            gameNumber.text = "7人以上で遊んでね！"
        }
        // Do any additional setup after loading the view.
    }
}
