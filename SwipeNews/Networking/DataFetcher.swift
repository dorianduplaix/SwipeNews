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

struct NewtorkDataFetcher<T: Decodable>: DataFetcher {
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
