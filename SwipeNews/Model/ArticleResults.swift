//
//  ArticleResults.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 19/03/2024.
//

import Foundation
import RealmSwift

struct ArticleResults: Model {
    var status: String
    var totalResults: Int
    var articles: [Article]
    
    init(_ dbModel: ArticleResultsDB) {
        self.status = dbModel.status
        self.totalResults = dbModel.totalResults
        dbModel.articles.forEach { article in
            articles.append(Article(article))
        }
    }
    
    func toDataBaseObject() -> DataBaseObject {
        return ArticleResultsDB(articleResultsAPI: self)
    }
}
