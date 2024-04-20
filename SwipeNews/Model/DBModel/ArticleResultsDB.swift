//
//  ArticleResultsDB.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 20/04/2024.
//

import Foundation
import RealmSwift

class ArticleResultsDB: DataBaseObject {
    @Persisted var status: String
    @Persisted var totalResults: Int
    @Persisted var articles: List<ArticleDB>
    
    convenience init(status: String, totalResults: Int, articles: List<ArticleDB>) {
        self.init()
        self.status = status
        self.totalResults = totalResults
        self.articles = articles
    }
    
    convenience init(articleResultsAPI: ArticleResults) {
        self.init()
        self.status = articleResultsAPI.status
        self.totalResults = articleResultsAPI.totalResults
        articleResultsAPI.articles.forEach { articleAPI in
            articles.append(ArticleDB(articleAPI: articleAPI))
        }
    }
}
