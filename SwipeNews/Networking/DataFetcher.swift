//
//  DataFetcher.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 19/03/2024.
//

import Foundation

protocol DataFetcher {
    associatedtype DataType
    func fetchData() async throws -> DataType
}
