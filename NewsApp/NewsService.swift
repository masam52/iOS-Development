//
//  NewsService.swift
//  NewsApp
//
//  Created by Matej Samaržija on 23.05.2026..
//

import SwiftUI

class NewsService {
    static let shared = NewsService()
    
    private let apiKey = "pub_ee772bbdfc074c29ac6e16b9230828bb"
    
    func fetchArticles() async throws -> [Article] {
        let url = URL(string: "https://newsdata.io/api/1/latest?apikey=\(apiKey)&language=hr")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(NewsAPIResponse.self, from: data)
        
        //i dalje izbacuje srpske clanke iako je language: croatian
            response.results.forEach { dto in
                print("Jezik: \(dto.language ?? "nil") | Naslov: \(dto.title)")
            }
        
        return response.results
            .filter { $0.language == "croatian" }
            .compactMap { dto in Article(from: dto) }
    }
}
