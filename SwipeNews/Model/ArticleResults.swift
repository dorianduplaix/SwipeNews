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
    
    func toDataBaseObject() -> DataBaseObject {
        return ArticleResultsDB(
            articleResultsAPI: ArticleResults(
                status: status,
                totalResults: totalResults,
                articles: articles
            )
        )
    }
    
    mutating func purgeBadNews() {
        articles = articles.filter { $0.title != "[Removed]" && $0.urlToImage != nil}
    }
}
