//
//  DefaultStorage.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 20/04/2024.
//

import Foundation
import RealmSwift

fileprivate let realm = try! Realm()

struct DefaultStorage: Storage {
    func save<Value: Object>(value: Value)  {
        realm.writeAsync {
            realm.add(value)
        }
    }
    
    func load<Value: Object>() -> Value? {
        return realm.objects(Value.self).first
    }
}
