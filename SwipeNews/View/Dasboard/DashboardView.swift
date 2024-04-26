//
//  DashboardView.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 19/03/2024.
//

import SwiftUI
import Combine
import RealmSwift

struct DashboardView: View {
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject private var storeData: StoreData
    
    @StateObject private var viewModel = ContentViewModel<NewsAPIService>()
    @State private var isActive = false
    
    var body: some View {
        NavigationStack {
            content
                .padding(.horizontal, -.space5)
                .navigationTitle("À la une")
        }
        .background(colorScheme == .dark ? Color.customDark : Color.shimmerGrey)
    }
    
    @ViewBuilder
    private var content: some View {
        if viewModel.isLoading {
            ProgressView()
        } else if let error = viewModel.error {
            ErrorView()
        } else if let articleResults = viewModel.articleResults {
            cardsList(articles: articleResults.articles)
        } else {
            HStack {
                Spacer()
                ProgressView()
                Spacer()
            }
        }
    }
    
    @ViewBuilder
    private func cardsList(articles: [Article]) -> some View {
        List {
            ForEach(articles, id: \.self) { article in
                CardView(bookmarked: isBookmarked(article: article),
                         article: article,
                         onBookmarkTap: {
                    bookmarkArticle(article: article)
                })
                    .frame(height: 600)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    .background(
                        //TODO: create details view
                        NavigationLink("", destination: Text(article.title))
                            .opacity(0)
                    )
            }
        }
        .listStyle(.plain)
    }
    
    private func bookmarkArticle(article: Article) {
        if let index = storeData.bookmarkedArticles.firstIndex(where: { $0.id == article.id }) {
            storeData.bookmarkedArticles.remove(at: index)
        } else {
            viewModel.
            storeData.bookmarkedArticles.append(article)
        }
    }
    
    private func isBookmarked(article: Article) -> Bool {
        return storeData.bookmarkedArticles.contains(article)
    }
}

class ContentViewModel<Service>: ObservableObject where Service: NewsAPI {
    @ObservedObject private var service: Service
    @Published var articleResults: ArticleResults?
    @Published var error: Error?
    @Published var isLoading = false
    private var cancellables = Set<AnyCancellable>()
    private var storage: Storage
    
    init(service: Service = NewsAPIService(network: NetworkDataFetcher(), storage: DefaultStorage.shared), storage: Storage) {
        self.service = service
        self.storage = storage
        //TODO: remove timer after removing the mock
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.loadAllData()
        }
    }
    
    func loadAllData() {
        Task {
            await service.loadAllData()
            handleState()
        }
    }
    
    func openArticleDetails() {
        
    }
    
    func onBookmarkArticleTap(article: Article) {
        guard let articleDB: ArticleDB = storage.load() else {
            storage.save(value: article)
            return
        }
        
        
        if let index = storeData.bookmarkedArticles.firstIndex(where: { $0.id == article.id }) {
            storeData.bookmarkedArticles.remove(at: index)
        } else {
            storeData.bookmarkedArticles.append(article)
        }
    }
    
    private func handleState() {
        service.articlesResults.value.publisher
            .sink(receiveCompletion: { completion in
                self.isLoading = true
                switch completion {
                    case .finished:
                        self.isLoading = false
                        break
                    case let .failure(error):
                        self.isLoading = false
                        self.error = error
                }
            }, receiveValue: { value in
                self.isLoading = false
                self.articleResults = value
            })
            .store(in: &cancellables)
    }
}

#Preview {
    DashboardView()
}
