//
//  DashboardView.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 19/03/2024.
//

import SwiftUI
import Combine

struct DashboardView: View {
    @ObservedObject var viewModel = ContentViewModel<NewsAPIService>()
    @State private var isActive = false
    
    var body: some View {
        NavigationStack {
            content
                .padding(.horizontal, -.space5)
                .navigationTitle("À la une")
        }
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
                    .tint(Color.gray)
                Spacer()
            }
        }
    }
    
    @ViewBuilder
    private func cardsList(articles: [Article]) -> some View {
        List {
            ForEach(articles, id: \.self) { article in
                CardView(article: article)
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
}

class ContentViewModel<Service>: ObservableObject where Service: NewsAPI {
    @ObservedObject var service: Service
    @Published var articleResults: ArticleResults?
    @Published var error: Error?
    @Published var isLoading = false
    private var cancellables = Set<AnyCancellable>()
    
    init(service: Service = NewsAPIService(network: MockDataFetcher())) {
        self.service = service
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
