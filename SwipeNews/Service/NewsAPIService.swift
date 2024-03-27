//
//  NewsAPIService.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 20/03/2024.
//

import Foundation

protocol NewsAPI {
    func loadAllData() async
    var articlesResults: Loadable<ArticleResults> { get }
}

class NewsAPIService: Service, NewsAPI, ObservableObject {
    typealias Fetcher = MockDataFetcher<ArticleResults>
    @Published private (set) var articlesResults: Loadable<ArticleResults> = .notRequested
    private let network: Fetcher
    
    required init(network: Fetcher) {
        self.network = network
    }
    
    func loadAllData() async {
        return await withCheckedContinuation { continuation in
            DispatchQueue.main.async {
                let endpoint = Endpoint(api: .newsAPI(.everything), queryItems: [])
                self.articlesResults.setIsLoading(self.network.fetchData(endpoint)
                    .sink(receiveCompletion: { completion in
                        switch completion {
                            case .finished:
                                break
                            case let .failure(error):
                                DispatchQueue.main.async {
                                    self.articlesResults.setError(error)
                                    continuation.resume()
                                }
                        }
                    }, receiveValue: { value in
                        DispatchQueue.main.async {
                            self.articlesResults.setValue(value)
                            continuation.resume()
                        }
                    }))
                
            }
        }
    }
}
