//
//  TabBarAsset.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 26/03/2024.
//

import SwiftUI

enum TabBarAsset {
    case dashboard(isSelected: Bool)
    case myNews(isSelected: Bool)
    case profile(isSelected: Bool)
    
    var tabItem: some View {
        Label(self.title, systemImage: self.image)
    }
    
    private var image: String {
        switch self {
            case let .dashboard(isSelected):
                return isSelected ? "house.fill" : "house"
            case let .myNews(isSelected):
                return isSelected ? "menucard.fill" : "menucard"
            case let .profile(isSelected):
                return isSelected ? "person.crop.circle.fill" : "person.crop.circle"
        }
    }
    
    private var title: String {
        switch self {
            case .dashboard:
                return "À la une"
            case .myNews:
                return "Mes actualités"
            case .profile:
                return "Mon profil"
        }
    }
}
