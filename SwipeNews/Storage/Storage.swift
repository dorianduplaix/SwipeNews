//
//  Storage.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 20/04/2024.
//

import Foundation
import RealmSwift

protocol Storage {
    func load<Value: Object> () -> Value?
    func save<Value: Object>(value: Value)
}
