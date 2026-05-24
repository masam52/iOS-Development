//
//  NewsAPIResponse.swift
//  NewsApp
//
//  Created by Matej Samaržija on 23.05.2026..
//

struct NewsAPIResponse: Codable {
    let results: [ArticleDTO]
}

struct ArticleDTO: Codable {
    let article_id: String
    let title: String
    let description: String?
    let image_url: String?
    let pubDate: String?
    let creator: [String]?
    let category: [String]?
    let language: String?
}
