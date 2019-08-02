//
//  Item.swift
//  shlack
//
//  Created by 畑田将太 on 2019/08/02.
//  Copyright © 2019 畑田将太. All rights reserved.
//

import Foundation
import RealmSwift

class Games: Object {
    // ID
    @objc dynamic var id: Int = 0
    //ゲーム名
    @objc dynamic var name: String? = nil
    //ルール
    @objc dynamic var rule: String? = nil
    
    // データを保存。
    func save() {
        let realm = try! Realm()
        if realm.isInWriteTransaction {
            if self.id == 0 {
                self.id = self.createNewId()
            }
            realm.add(self)
        }
        else {
            try! realm.write {
                if self.id == 0 {
                    self.id = self.createNewId()
                    
                }
                realm.add(self)
            }
        }
    }
    
    // 新しいIDを採番します。
    private func createNewId() -> Int {
        let realm = try! Realm()
        return (realm.objects(type(of: self).self).sorted(byKeyPath: "id", ascending: false).first?.id ?? 0) + 1
    }
    
    // プライマリーキーの設定
    override static func primaryKey() -> String? {
        return "id"
    }
}
