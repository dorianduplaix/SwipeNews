//
//  Routes.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 19/03/2024.
//

import Foundation

enum Routes {
    case everything
    case topHeadlines
    case topHeadlinesSource
    
    var url: URL {
        var endpoint = ""
        switch self {
            case .everything:
                endpoint = "everything"
            case .topHeadlines:
                endpoint = "top-headlines"
            case .topHeadlinesSource:
                endpoint = "top-headlines/sources"
        }
        return URL(string: "https://newsapi.org/v2/\(endpoint)?apiKey=\(API_KEY)")!
    }
}

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
    
    private let baseURL = "https://newsapi.org/v2/"
    private let apiKey = "c101329edd4f441a888c97f8d1e836e5"
    
    static func search(matching query: String,
                       sortedBy sorting: Sorting = .recency) -> Endpoint {
        return Endpoint(path: "/search/repositories", queryItems: [
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "sort", value: sorting.rawValue)
        ])
    }
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "newsapi.org"
        components.path = "v2"
        components.queryItems = queryItems
        
        return components.url
    }
}
