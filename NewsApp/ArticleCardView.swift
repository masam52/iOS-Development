//
//  ArticleCardView.swift
//  NewsApp
//
//  Created by Matej Samaržija on 14.04.2026..
//

import SwiftUI

struct ArticleCardView: View {
    let article: Article

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            AsyncImage(url: article.image_url) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray
            }
            .frame(width: 100, height: 110)
            .cornerRadius(5)

            VStack(alignment: .leading, spacing: 6) {
                Text(categoryText(article.category))
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(categoryColor(article.category).opacity(0.4))
                    .foregroundStyle(.gray)
                    .cornerRadius(5)

                Text(article.title)
                    .foregroundStyle(categoryColor(article.category))
                    .font(.headline)
                    .bold()

                Text(article.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }

        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 3)
    }

    func categoryText(_ category: Category) -> String {
        switch category {
        case .Sport(let sub):
            if let sub = sub {
                return "Sport - \(sub)"
            } else {
                return "Sport"
            }

        case .Lifestyle(let sub):
            if let sub = sub {
                return "Lifestyle - \(sub)"
            } else {
                return "Lifestyle"
            }

        case .Svijet(let sub):
            if let sub = sub {
                return "Svijet - \(sub)"
            } else {
                return "Svijet"
            }
        }
    }
    
    func categoryColor(_ category: Category) -> Color {
        switch category {
        case .Sport(_):
            return .green
        case .Lifestyle(_):
            return .orange
        case .Svijet(_):
            return .red
        }
    }
}


#Preview {
    ArticleCardView(
        article:mockArticles[1]
    )
}



//#Preview {
//    ArticleCardView(
//        article: Article(
//            title: "Modrić (40) osvojio Zlatnu loptu!",
//            description: "Luka Modrić službeno je postao najstariji igrač koji osvojio prestižnu Zlatnu loptu.",
//            content: "Content",
//            image_url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/e/e9/ISL-HRV_%287%29.jpg")!,
//            publishedAt: Date(),
//            author: "Matej S.",
//            category: .Sport(.Nogomet),
//            ratings: [5, 4, 5]
//        )
//    )
//}
