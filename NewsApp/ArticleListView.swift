//
//  ArticleListView.swift
//  NewsApp
//
//  Created by Matej Samaržija on 14.04.2026..
//

import SwiftUI

struct ArticlesListView: View {
    @State private var state: LoadingState<[Article]> = .loading
    @State private var articles: [Article] = []

    var body: some View {
        NavigationStack {
            Group {
                switch state {
                case .loading:
                    ProgressView("Učitavanje vijesti...")
                    
                case .error(let message):
                    VStack {
                        Image(systemName: "wifi.slash")
                            .font(.largeTitle)
                        Text(message)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                    
                case .success:
                    ScrollView {
                        VStack(spacing: 10) {
                            ForEach($articles) { $article in
                                NavigationLink(destination: ArticleDetailView(article: $article)) {
                                    ArticleCardView(article: article)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal, 10)
                        .padding(.top, 10)
                    }
                }
            }
            .task {
                do {
                    let fetched = try await NewsService.shared.fetchArticles()
                    articles = fetched
                    state = .success(fetched)
                } catch {
                    state = .error("Greška pri učitavanju vijesti.")
                }
            }
        }
    }
}

#Preview {
    ArticlesListView()
}

