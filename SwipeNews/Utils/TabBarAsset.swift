//
//  TabBarAsset.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 26/03/2024.
//

import SwiftUI

enum TabBarAsset {
    case dashboard
    case myNews
    case profile
    
    var tabItem: some View {
        Label(self.title, systemImage: self.systemImage)
    }
    
    private var systemImage: String {
        switch self {
            case .dashboard:
                return "house"
            case .myNews:
                return "menucard"
            case .profile:
                return "person.crop.circle"
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
