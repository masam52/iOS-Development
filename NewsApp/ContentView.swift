//
//  ContentView.swift
//  NewsApp
//
//  Created by Matej Samaržija on 14.04.2026..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ArticlesListView(articles: mockArticles)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
