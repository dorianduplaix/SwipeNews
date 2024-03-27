//
//  MainView.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 26/03/2024.
//

import SwiftUI

struct MainView: View {
    @State private var tabSelected = 0
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    TabBarAsset.dashboard.tabItem
                }
            Color(.red)
                .tabItem {
                    TabBarAsset.myNews.tabItem
                }
            Color(.yellow)
                .tabItem {
                    TabBarAsset.profile.tabItem
                }
        }
        .tint(.customBluePrimary)
        .toolbarColorScheme(.dark, for: .tabBar)
    }
}

#Preview {
    MainView()
}
