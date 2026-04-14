//
//  ArticleListView.swift
//  NewsApp
//
//  Created by Matej Samaržija on 14.04.2026..
//

import SwiftUI

struct ArticlesListView: View {
    let articles: [Article]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(articles) { article in
                        NavigationLink(destination: ArticleDetailView(article: article)) {
                            ArticleCardView(article: article)}
                                .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 10)
                .padding(.top, 10)
            }
        }
    }
}

#Preview {
    ArticlesListView(articles: Article.mockArticles)
}
