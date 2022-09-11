//
//  NewsAPIResponse.swift
//  NewsApp
//
//  Created by Andy Zhao on 2022-06-12.
//

import Foundation

struct NewsAPIResponse: Decodable {
    let status: String // non optional
    let totalResults: Int?
    let articles: [Article]?
    
    let code: String? // (i.e. parametersmissing) when error
    let message: String?
    
    
}
