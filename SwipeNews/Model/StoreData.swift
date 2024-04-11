//
//  StoreData.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 10/04/2024.
//

import Foundation

class StoreData: ObservableObject {
    @Published var bookmarkedArticles: [Article] = []
    @Published var blockedSources: [Source] = []
    @Published var country: String = "France"
    @Published var notificationsActivated = false
}
