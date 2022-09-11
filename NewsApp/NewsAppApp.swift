//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Andy Zhao on 2022-06-09.
//

import SwiftUI

@main
struct NewsAppApp: App {
    
    // environment object provided here in the root level so other classes can find it
    @StateObject var articleBookmarkVM = ArticleBookmarkViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(articleBookmarkVM)
        }
    }
}
