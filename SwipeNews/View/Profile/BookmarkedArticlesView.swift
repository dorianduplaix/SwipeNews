//
//  BookmarkedArticlesView.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 10/04/2024.
//

import SwiftUI

struct BookmarkedArticlesView: View {
    @EnvironmentObject private var storeData: StoreData
    
    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Articles sauvegardés")
        }
    }
    
    @ViewBuilder
    private var content: some View {
        if storeData.bookmarkedArticles.isEmpty {
            EmptyListView(image: "bookmark",
                          title: "Aucun article sauvegardé",
                          description: "La liste des articles est sauvegardée sur votre iPhone.")
        } else {
            List {
                ForEach($storeData.bookmarkedArticles, id: \.self) { article in
                    BookmarkedItem(article: article.wrappedValue)
                        .frame(height: 100)
                        .alignmentGuide(.listRowSeparatorLeading, computeValue: { dimension in
                            dimension[.leading] - 10000
                        })
                }
                .onDelete(perform: delete)
            }
            .listStyle(.grouped)
        }
    }
    
    private func delete(at offsets: IndexSet) {
        storeData.bookmarkedArticles.remove(atOffsets: offsets)
    }
}

#Preview {
    BookmarkedArticlesView()
}
