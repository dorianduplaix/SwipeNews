//
//  DataFetcher.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 19/03/2024.
//

import Foundation
import Combine

protocol DataFetcher {
    associatedtype DataType
    func fetchData(_ endpoint: Endpoint?) -> AnyPublisher<DataType, Error>
}

struct NetworkDataFetcher<T: Decodable>: DataFetcher {
    typealias DataType = T
    
    func fetchData(_ endpoint: Endpoint?) -> AnyPublisher<DataType, Error> {
        guard let url = endpoint?.url else {
            return Fail(error: NSError(domain: "URL is required for network service", code: 400)).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: DataType.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

struct LocalDataFetcher<T: Decodable>: DataFetcher {
    typealias DataType = T

    func fetchData(_ endpoint: Endpoint?) -> AnyPublisher<DataType, Error> {
        // Implement your logic to fetch data from local database
        // For example:
        // let data = fetchDataFromDatabase()
        // return Just(data)
        return Fail(error: NSError(domain: "Not implemented", code: 501, userInfo: nil)).eraseToAnyPublisher()
    }
}

struct MockDataFetcher<T: Decodable>: DataFetcher {
    typealias DataType = T
    var error = false
    var valueToReturn: Data = NewsAPIFakes.queryBitcoin!
    private let decoder = JSONDecoder()
    
    func fetchData(_ endpoint: Endpoint?) -> AnyPublisher<DataType, Error> {
        guard !error else {
            return Result.failure(URLError(.timedOut)).publisher.eraseToAnyPublisher()
        }
        let toReturn: DataType = try! decoder.decode(DataType.self, from: valueToReturn)
        return Result<T, Error>.success(toReturn).publisher.eraseToAnyPublisher()
    }
}
