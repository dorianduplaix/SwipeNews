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
    
    var body: some View {
        NavigationView {
            List {
                VStack {
                    NavigationLink {
                        Color.blue
                    } label : {
                        content
                    }
                }
                .padding()
            }
            .navigationTitle("À la une")
        }
    }
    
    @ViewBuilder
    private var content: some View {
        if viewModel.isLoading {
            Text("Loading ...")
        } else if let error = viewModel.error {
            ErrorView()
        } else if let articleResults = viewModel.articleResults {
            VStack {
                CardView(height: 200)
                Text(articleResults.articles.first!.title)
            }
        } else {
            Text("Empty")
        }
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
        self.loadAllData()
    }
    
    func loadAllData() {
        Task {
            await service.loadAllData()
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
                    print("Value received")
                    self.isLoading = false
                    self.articleResults = value
                })
                .store(in: &cancellables)
        }
    }
}

#Preview {
    DashboardView()
}
