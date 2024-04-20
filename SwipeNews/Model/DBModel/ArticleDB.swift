//
//  ArticleDB.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 20/04/2024.
//

import Foundation
import RealmSwift

class ArticleDB: DataBaseObject, Identifiable {
    @Persisted var id: String
    @Persisted var source: SourceDB
    @Persisted var author: String?
    @Persisted var title: String
    @Persisted var subtitle: String?
    @Persisted var url: String
    @Persisted var urlToImage: String?
    @Persisted var publishedAt: String
    @Persisted var content: String
    
    convenience init(
        id: String,
        source: SourceDB,
        author: String? = nil,
        title: String,
        subtitle: String? = nil,
        url: String,
        urlToImage: String? = nil,
        publishedAt: String,
        content: String
    ) {
        self.init()
        self.id = id
        self.source = source
        self.author = author
        self.title = title
        self.subtitle = subtitle
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
    
    convenience init(articleAPI: Article) {
        self.init()
        self.id = articleAPI.id
        self.source = SourceDB(sourceAPI: articleAPI.source)
        self.author = articleAPI.author
        self.title = articleAPI.title
        self.subtitle = articleAPI.description
        self.url = articleAPI.url
        self.urlToImage = articleAPI.urlToImage
        self.publishedAt = articleAPI.publishedAt
        self.content = articleAPI.content
    }
}

class SourceDB: Object {
    @Persisted var id: String?
    @Persisted var name: String
    
    convenience init(id: String? = nil, name: String) {
        self.init()
        self.id = id
        self.name = name
    }
    
    convenience init(sourceAPI: Source) {
        self.init()
        self.id = sourceAPI.id
        self.name = sourceAPI.name
    }
}
