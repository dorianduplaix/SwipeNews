//
//  DashboardView.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 19/03/2024.
//

import SwiftUI

struct DashboardView: View {
    @StateObject var service = NewsAPIService(network: MockDataFetcher())
    
    var body: some View {
        NavigationView {
            List {
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hey")
                    content
                    content
                    content
                    content
                    content
                    content
                    content
                    content
                    content
                    content
                    content
                    content
                    content
                    content
                }
                .onAppear {
                    loadData()
                }
                .padding()
            }
            .navigationTitle("À la une")
        }
    }
    
    @ViewBuilder private var content: some View {
        // switch display based on data lifecycle
        // no business logic, just reacting to event
        switch service.articlesResults {
            case .loading(let last, _):
                if let lastValue = last {
                    Text(lastValue.articles.first!.title)
                } else {
                    Text("Loading ...")
                }
            case .loaded(let value):
                Text(value.articles.first!.title)
            case .error(let error):
                ErrorView()
            case .notRequested:
                EmptyView()
        }
    }
    
    func loadData() {
        Task {
            await service.loadAllData()
        }
    }
}

class ContentViewModel: ObservableObject {
    
}

#Preview {
    DashboardView()
}
