//
//  ProfileAsset.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 07/04/2024.
//

import SwiftUI

enum ProfileAsset {
    case bookmarkedArticles
    case blockedSources
    case interestPoints
    case country
    case notification
    case note
    case aboutUs
    
    var icon: Image {
        switch self {
            case .bookmarkedArticles:
                Image(systemName: "bookmark")
            case .blockedSources:
                Image(systemName: "xmark.circle")
            case .interestPoints:
                Image(systemName: "checkmark.rectangle.stack")
            case .country:
                Image(systemName: "globe")
            case .notification:
                Image(systemName: "bell.badge")
            case .note:
                Image(systemName: "rectangle.and.pencil.and.ellipsis")
            case .aboutUs:
                if let appIcon = Image.appIcon() {
                    appIcon
                } else {
                    Image(systemName: "hand.thumbsup")
                }
        }
    }
    
    var title: String {
        switch self {
            case .bookmarkedArticles:
                "Articles sauvegardés"
            case .blockedSources:
                "Sources bloquées"
            case .interestPoints:
                "Gérez vos centres d'intérêt"
            case .country:
                "Provenance des articles"
            case .notification:
                "Activer les notifications"
            case .note:
                "Notez-nous"
            case .aboutUs:
                "À propos de SwipeNews"
        }
    }
    
    var withSwitch: Bool {
        return self == .notification
    }
}
