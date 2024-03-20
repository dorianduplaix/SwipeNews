//
//  NewsAPI.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 20/03/2024.
//

import Foundation

enum NewsAPIPath: String {
    case everything = "/everything"
    case topHeadlines = "/top-headlines"
    case topHeadlinesSource = "/top-headlines/sources"
}

struct NewsAPIEndpoint {
    static func allArticles(for path: NewsAPIPath) -> Endpoint {
        return Endpoint(api: .newsAPI(path), queryItems: [])
    }
    
    static func topHeadlines(for path: NewsAPIPath) -> Endpoint {
        return Endpoint(api: .newsAPI(path), queryItems: [])
    }
    
    static func topHeadlinesSource(for path: NewsAPIPath) -> Endpoint {
        return Endpoint(api: .newsAPI(path), queryItems: [])
    }
    
    static func search(_ query: String, for path: NewsAPIPath) -> Endpoint {
        return Endpoint(api: .newsAPI(path), queryItems: [URLQueryItem(name: "q", value: query)])
    }
}
