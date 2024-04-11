//
//  ProfileMainView.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 07/04/2024.
//

import SwiftUI

struct ProfileMainView: View {
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject private var storeData: StoreData
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Général")) {
                    NavigationLink(destination: BookmarkedArticlesView(), label: {
                        ProfileItem(item: .bookmarkedArticles, value: String(storeData.bookmarkedArticles.count))
                    })
                    NavigationLink(destination: Text("dazdazdazdazd"), label: {
                        ProfileItem(item: .blockedSources, value: String(storeData.blockedSources.count))
                    })
                    NavigationLink(destination: Text("dazdazdazdazd"), label: {
                        ProfileItem(item: .interestPoints)
                    })
                    NavigationLink(destination: Text("dazdazdazdazd"), label: {
                        ProfileItem(item: .country, value: storeData.country)
                    })
                    ProfileItem(item: .notification)
                }
                
                Section(header: Text("À propos")) {
                    NavigationLink(destination: Text("dazdazdazdazd"), label: {
                        ProfileItem(item: .note)
                    })
                    NavigationLink(destination: AboutUsView(), label: {
                        ProfileItem(item: .aboutUs)
                    })
                }
            }
            .navigationTitle("Mon profil")
        }
    }
}

#Preview {
    ProfileMainView()
        .environmentObject(StoreData())
}
