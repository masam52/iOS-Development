//
//  ReadArticlesService.swift
//  NewsApp
//
//  Created by Matej Samaržija on 24.05.2026..
//


import SwiftUI

class ReadArticlesService {
    static let shared = ReadArticlesService()
    
    private let key = "read_article_ids"
    
    func getReadIds() -> Set<String> {
        guard let data = UserDefaults.standard.data(forKey: key),
              let ids = try? JSONDecoder().decode(Set<String>.self, from: data)
        else { return [] }
        return ids
    }
    
    func markAsRead(_ id: String) {
        var ids = getReadIds()
        ids.insert(id)
        if let data = try? JSONEncoder().encode(ids) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
