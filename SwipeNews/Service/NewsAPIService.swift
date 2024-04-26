//
//  NewsAPIService.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 20/03/2024.
//

import Foundation

protocol NewsAPI: ObservableObject {
    func loadAllData() async
    var articlesResults: Loadable<ArticleResults> { get }
}

class NewsAPIService: Service, NewsAPI {
    typealias Fetcher = NetworkDataFetcher<ArticleResults>
    @Published private (set) var articlesResults: Loadable<ArticleResults> = .notRequested
    private let network: Fetcher
    private let storage: Storage
    private let lastNetworkCallKey = "lastNetworkCallTimestamp"
    
    required init(network: Fetcher, storage: Storage) {
        self.network = network
        self.storage = storage
    }
    
    func loadAllData() async {
        guard shouldFetchFromNetwork() else {
            print("db")
            guard let initalValues: ArticleResultsDB = storage.load() else {
                return
            }
            await self.articlesResults.setValue(ArticleResults(initalValues))
            return
        }
        print("call")
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
                            var purgedValue = value
                            purgedValue.articles = self.purgeBadNews(articles: value.articles)
                            self.storage.save(value: purgedValue.toDataBaseObject())
//                            self.dataSource.appendItem(articleResults: purgedValue)
                            self.articlesResults.setValue(purgedValue)
                            continuation.resume()
                        }
                    }))
            }
        }
    }
    
    private func purgeBadNews(articles: [Article]) -> [Article] {
        return articles.filter { $0.title != "[Removed]" && $0.urlToImage != nil }
    }
    
    private func shouldFetchFromNetwork() -> Bool {
        guard let lastNetworkCallTimestamp = UserDefaults.standard.value(forKey: lastNetworkCallKey) as? TimeInterval else {
            return true // No previous network call, fetch from network
        }
        let currentTime = Date().timeIntervalSinceReferenceDate
        let elapsedTime = currentTime - lastNetworkCallTimestamp
        return elapsedTime > NETWORK_CALL_INTERVAL
    }
}
