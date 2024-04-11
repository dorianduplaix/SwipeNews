//
//  ArticleResults.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 19/03/2024.
//

import Foundation

struct ArticleResults: Decodable {
    var status: String
    var totalResults: Int
    var articles: [Article]
    
    mutating func purgeBadNews() {
        articles = articles.filter { $0.title != "[Removed]" && $0.urlToImage != nil}
    }
}
