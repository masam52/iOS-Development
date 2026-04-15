//
//  ArticleDetailView.swift
//  NewsApp
//
//  Created by Matej Samaržija on 15.04.2026..
//

import SwiftUI

struct ArticleDetailView: View {
    @Binding var article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: article.image_url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                } placeholder: {
                    Color.gray
                }
                .clipped()
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(article.category.text)
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(article.category.color.opacity(0.4))
                        .foregroundStyle(.gray)
                        .cornerRadius(5)
                    
                    Text(article.title)
                        .font(.title2)
                        .bold()
                    
                    HStack (spacing: 15){
                        Text(article.author ?? "Redakcija")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                        
    //                    if let author = article.author {     --binding
    //                        Text(author)
    //                            .foregroundStyle(.gray)
    //                            .font(.subheadline)
    //                    }
                        
                        Text(article.publishedAt, style: .date)
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    
                    Text(article.content)
                        .font(.body)
                        .foregroundStyle(.primary)
                }
                .padding(.horizontal, 16)
                
                .onAppear() {
                    article.isRead = true
                }
                .toolbar(.hidden, for: .tabBar)
            }
        }
    }
}

#Preview {
    ArticleDetailView(article: .constant(Article.mockArticles[0]))
}
