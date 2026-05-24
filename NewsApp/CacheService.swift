//
//  CacheService.swift
//  NewsApp
//
//  Created by Matej Samaržija on 24.05.2026..
//

import SwiftUI

class CacheService {
    static let shared = CacheService()
    
    private let fileName = "articles_cache.json"
    
    // putanja do fajla na disku
    private var fileURL: URL {
        FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(fileName)
    }
    
    // sprema listu članaka na disk
    func save(_ articles: [Article]) {
        if let data = try? JSONEncoder().encode(articles) {
            try? data.write(to: fileURL)
        }
    }
    
    func load() -> [Article]? {
        guard let data = try? Data(contentsOf: fileURL) else { return nil }
        return try? JSONDecoder().decode([Article].self, from: data)
    }
}
