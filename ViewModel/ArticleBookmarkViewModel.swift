//
//  ArticleBookmarkViewModel.swift
//  NewsApp
//
//  Created by Andy Zhao on 2022-06-17.
//

// To make bookmarks persistent, store the information inside the document directory of the user. 

import SwiftUI

@MainActor
class ArticleBookmarkViewModel: ObservableObject {
    @Published private(set) var bookmarks: [Article] = []
    // create a function to check the bookmark status of an article, bookmark and article, and remove an article from bookmark
    
    private let bookmarkStore = PlistDataStore<[Article]>(filename: "bookmarks")
    
    // to make sure there are no multiple instances of bookmarks file during the runtime of the app
    static let shared = ArticleBookmarkViewModel()
    private init() {
        Task {
            await load()
        }
    }
    
    private func load() async {
        bookmarks = await bookmarkStore.load() ?? []
    }
    
    func isBookmarked(for article: Article) -> Bool {
        bookmarks.first { article.id == $0.id } != nil
        
    }
    
    func addBookmark(for article: Article) {
        guard !isBookmarked(for: article) else {
            return
        }
        bookmarks.insert(article, at: 0)
        bookmarkUpdated()
    }
    
    func removeBookmark(for article: Article) {
        guard let index = bookmarks.firstIndex(where: { $0.id == article.id }) else {
            return
        }
        bookmarks.remove(at: index)
        bookmarkUpdated()
    }
    
    private func bookmarkUpdated() {
        let bookmarks = self.bookmarks
        Task {
            await bookmarkStore.save(bookmarks)
        }
    }
}
