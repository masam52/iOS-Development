//
//  ContentView.swift
//  NewsApp
//
//  Created by Matej Samaržija on 14.04.2026..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ArticlesListView(articles: Article.mockArticles)
                .tabItem{
                    Label("Novosti", systemImage: "newspaper")
                }
            Text("Igrice")
                .tabItem{
                    Label("Igrice", systemImage: "gamecontroller")
                }
        }
    }
}

#Preview {
    ContentView()
}
