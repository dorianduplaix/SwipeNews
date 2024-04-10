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
        TabView(selection: $tabSelected) {
            DashboardView()
                .tabItem {
                    TabBarAsset.dashboard(isSelected: tabSelected == 0).tabItem
                }
                .tag(0)
            Color(.red)
                .tabItem {
                    TabBarAsset.myNews(isSelected: tabSelected == 1).tabItem
                }
                .tag(1)
            ProfileMainView()
                .tabItem {
                    TabBarAsset.profile(isSelected: tabSelected == 2).tabItem
                }
                .tag(2)
        }
        .tint(Color.customBluePrimary)
    }
}

#Preview {
    MainView()
}
