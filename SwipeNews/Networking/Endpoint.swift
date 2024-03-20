//
//  Routes.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 19/03/2024.
//

import Foundation

struct Endpoint {
    let api: API
    let queryItems: [URLQueryItem]
    private let queryLanguage = URLQueryItem(name: "language", value: "en")
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = api.components.scheme
        components.host = api.components.host
        components.path = api.components.path
        var completeQueryItems = queryItems
        completeQueryItems.append(queryLanguage)
        completeQueryItems.append(URLQueryItem(name: api.components.apiName, value: API_KEY))
        components.queryItems = completeQueryItems
        return components.url
    }
}

enum API {
    case newsAPI(NewsAPIPath)
    
    var components: APIComponents {
        switch self {
            case let .newsAPI(path):
                return APIComponents(apiName: "apiKey",
                                     scheme: "https",
                                     host: "newsapi.org", 
                                     path: "/v2\(path.rawValue)")
        }
    }
}

struct APIComponents {
    var apiName: String
    var scheme: String
    var host: String
    var path: String
}
