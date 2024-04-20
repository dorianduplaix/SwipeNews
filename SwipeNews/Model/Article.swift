//
//  Article.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 19/03/2024.
//

import Foundation

struct Article: Model, Identifiable {
    let id: String = UUID().uuidString
    var source: Source
    var author: String?
    var title: String
    var description: String?
    var url: String
    var urlToImage: String?
    var publishedAt: String
    var content: String
    
    func toDataBaseObject() -> DataBaseObject {
        return ArticleDB(
            id: id,
            source: SourceDB(id: source.id, name: source.name),
            author: author,
            title: title,
            subtitle: description,
            url: url,
            urlToImage: urlToImage,
            publishedAt: publishedAt,
            content: content
        )
    }
}

struct Source: Model {
    var id: String?
    var name: String
    
    func toDataBaseObject() -> DataBaseObject {
        return SourceDB(id: id, name: name)
    }
}
