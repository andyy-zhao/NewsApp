//
//  ArticleNewsViewModel.swift
//  NewsApp
//
//  Created by Andy Zhao on 2022-06-12.
//

import SwiftUI

enum DataFetchPhase<T> {
    case empty
    case success(T)
    case failure(Error)
}

struct FetchTaskToken: Equatable {
    var category: Category
    var token: Date
}

@MainActor
class ArticleNewsViewModel: ObservableObject {
    @Published var phase = DataFetchPhase<[Article]>.empty
    @Published var fetchTaskToken: FetchTaskToken // whenever category changes, update UI
    private let newsAPI = NewsAPI.shared
    
    init(articles: [Article]? = nil, selectedCategory: Category = .general) {
        if let articles = articles {
            self.phase = .success(articles)
        } else {
            self.phase = .empty
        }
        self.fetchTaskToken = FetchTaskToken(category: selectedCategory, token: Date())
    }
    
    func loadArticles() async {
      //  phase = .success(Article.previewData) // uncomment and remove this when want to make api call. this is here so we don't exceed quote
        if Task.isCancelled { return }
        phase = .empty // this will reset the UI
        do {
            let articles = try await newsAPI.fetch(from: fetchTaskToken.category)
            if Task.isCancelled { return }
            phase = .success(articles)
        } catch {
            if Task.isCancelled { return }
            print(error.localizedDescription)
            phase = .failure(error)
        }
    }
}
