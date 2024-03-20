//
//  MockDataFetcher.swift
//  SwipeNewsTests
//
//  Created by Dorian Duplaix on 20/03/2024.
//

import XCTest
import Combine
@testable import SwipeNews

class MockDataFetcher<T: Decodable>: DataFetcher {
    typealias DataType = T
    var error = false
    var valueToReturn: Data!
    private let decoder = JSONDecoder()
    
    func fetchData(_ endpoint: SwipeNews.Endpoint?) -> AnyPublisher<T, Error> {
        guard !error else {
            return Result.failure(URLError(.timedOut)).publisher.eraseToAnyPublisher()
        }
        let toReturn: T = try! decoder.decode(T.self, from: valueToReturn)
        return Result<T, Error>.success(toReturn).publisher.eraseToAnyPublisher()
    }
}
