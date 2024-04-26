//
//  Service.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 20/03/2024.
//

import Foundation

protocol Service {
    associatedtype Fetcher: DataFetcher
    init(network: Fetcher, storage: Storage)
}
