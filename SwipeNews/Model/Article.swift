//
//  Article.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 19/03/2024.
//

import Foundation

struct Article: Decodable {
    var source: Source
    var author: String?
    var title: String
    var description: String?
    var url: String
    var urlToImage: String?
    var publishedAt: Date
    var content: String
}

struct Source: Decodable {
    var id: String?
    var name: String
}
