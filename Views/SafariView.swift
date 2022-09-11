//
//  SafariView.swift
//  NewsApp
//
//  Created by Andy Zhao on 2022-06-12.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    
    func makeUIViewController(context: Context) -> some SFSafariViewController { // returning sfsafariviewcontroller
        SFSafariViewController(url: url)
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
}
