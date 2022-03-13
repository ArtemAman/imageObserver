//
//  RealmBase.swift
//  imageObserver
//
//  Created by Artyom Amankeldiev on 13.03.2022.
//

import Foundation

import RealmSwift

let realm = try! Realm()


class RealmBase {
    
   static func saveData(_ place: BaseModel) {
        try! realm.write {
            realm.add(place)
        }
    }
    
    static func deleteAll() {
        try! realm.write {
          realm.deleteAll()
        }
    }
}
