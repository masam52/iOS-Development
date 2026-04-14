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
        ScrollView {
            VStack(spacing: 10) {
                ForEach(articles) { article in
                    ArticleCardView(article: article)
                }
            }
            .padding(.horizontal, 10)
            .padding(.top, 10)
        }
    }
}

#Preview {
    ArticlesListView(articles: Article.mockArticles)
}
