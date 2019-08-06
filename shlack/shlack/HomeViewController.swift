//
//  HomeViewController.swift
//  shlack
//
//  Created by Itsuki Murayama on 2019/08/05.
//  Copyright © 2019 畑田将太. All rights reserved.
//
import UIKit
import RealmSwift

//game名を格納する配列
var gamelist: Results<Games>?
//Realmのインスタンスを初期化
var realm : Realm? = nil

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        realm  = try! Realm();
        gamelist = realm!.objects(Games.self)
    }
}
