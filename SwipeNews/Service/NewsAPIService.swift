//
//  NewsAPIService.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 20/03/2024.
//

import Foundation

class NewsAPIService: Service, ObservableObject {
    typealias Fetcher = NewtorkDataFetcher<ArticleResults>
    @Published private (set) var articlesResults: Loadable<ArticleResults> = .notRequested
    private let network: Fetcher
    
    required init(network: Fetcher) {
        self.network = network
    }

    func loadData(path: NewsAPIPath, queryItems: [URLQueryItem]) async {
        return await withCheckedContinuation { continuation in
            DispatchQueue.main.async {
                let endpoint = Endpoint(api: .newsAPI(path), queryItems: queryItems)
                self.articlesResults.setIsLoading(self.network.fetchData(endpoint))
            }
        }
    }
}
