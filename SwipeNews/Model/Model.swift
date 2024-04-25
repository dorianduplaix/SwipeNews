//
//  Model.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 20/04/2024.
//

import Foundation
import RealmSwift

// Another name because 'Object' RealmSwift type is too vague
// I want to immediately no in the future that this type is for a DataBase object
typealias DataBaseObject = Object

protocol Model: Decodable, Hashable {
    func toDataBaseObject() -> DataBaseObject
}
