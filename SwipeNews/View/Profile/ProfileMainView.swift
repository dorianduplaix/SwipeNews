//
//  ProfileMainView.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 07/04/2024.
//

import SwiftUI

struct ProfileMainView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject private var viewModel = ProfileMainViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Général")) {
                    NavigationLink(destination: Text("dazdazdazdazd"), label: {
                        ProfileItem(item: .bookmarkedArticles, value: String(viewModel.bookmarkedArticles.count))
                    })
                    NavigationLink(destination: Text("dazdazdazdazd"), label: {
                        ProfileItem(item: .blockedSources, value: String(viewModel.blockedSources.count))
                    })
                    NavigationLink(destination: Text("dazdazdazdazd"), label: {
                        ProfileItem(item: .interestPoints)
                    })
                    NavigationLink(destination: Text("dazdazdazdazd"), label: {
                        ProfileItem(item: .country, value: viewModel.country)
                    })
                    ProfileItem(item: .notification)
                        .background(
                            NavigationLink("", destination: Text("dazdazdazd"))
                                .opacity(0)
                        )
                }
                
                Section(header: Text("À propos")) {
                    NavigationLink(destination: Text("dazdazdazdazd"), label: {
                        ProfileItem(item: .note)
                    })
                    NavigationLink(destination: Text("dazdazdazdazd"), label: {
                        ProfileItem(item: .aboutUs)
                    })
                }
            }
            .background(colorScheme == .dark ? Color.customDark : Color.shimmerGrey)
            .navigationTitle("Mon profil")
        }
    }
}

class ProfileMainViewModel: ObservableObject {
    @Published var bookmarkedArticles: [Article] = []
    @Published var blockedSources: [Source] = []
    @Published var country: String = "France"
    @Published var isNotificationsActivated = false
}

#Preview {
    ProfileMainView()
}
