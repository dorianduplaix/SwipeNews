//
//  ContentView.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 19/03/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var service = NewsAPIService(network: NewtorkDataFetcher())
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hey")
            content
        }
        .onAppear {
            loadData()
        }
        .padding()
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
//                    LoadingView()
                }
            case .loaded(let value):
                Text(value.articles.first!.title)
//                makeContent(rates)
            case .error(let error):
                Text("Error")
//                errorView(error)
            default:
                Text("Loading ...")
//                LoadingView()
        }
    }
    
    func loadData() {
        Task {
            await service.loadAllData()
        }
    }
}

class ContentViewModel: ObservableObject {
    @Published private(set) var articles = NewsAPIService(network: NewtorkDataFetcher())
}

#Preview {
    ContentView()
}
