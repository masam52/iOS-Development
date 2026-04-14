//
//  Article.swift
//  NewsApp
//
//  Created by Matej Samaržija on 12.04.2026..
//

import SwiftUI

struct Article: Identifiable, Equatable{
    let id = UUID()
    let title: String
    let description: String
    let content: String
    let image_url: URL
    let publishedAt: Date
    let author: String?
    let category: Category
    
    var ratings: [Int]
    
    var averageRating: Double {
        guard !ratings.isEmpty else { return 0 }
        return Double(ratings.reduce(0, +)) / Double(ratings.count)
    }
    
    static let mockArticles: [Article] = [
            Article(title: "Dinamo pobijedio Hajduk",
                    description: "U derbiju sezone zagrebački Dinamo očekivano je svladao Splićane 4:0. Ova pobjeda gotovo je osigurala...",
                    content: "Content",
                    image_url: URL(string: "https://image.dnevnik.hr/media/images/1296x640/Aug2019/61744692-hajduk--dinamo.jpg")!,
                    publishedAt: Date(),
                    author: "Ivan H.",
                    category: .Sport(.Nogomet),
                    ratings: [5, 4, 5]),
            Article(
                title: "Modrić (40) osvojio Zlatnu loptu!",
                description: "Luka Modrić službeno je postao najstariji igrač koji osvojio prestižnu Zlatnu loptu.",
                content: "Content",
                image_url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/e/e9/ISL-HRV_%287%29.jpg")!,
                publishedAt: Date(),
                author: "Matej S.",
                category: .Sport(.Nogomet),
                ratings: [5, 4, 5]
            ),
            Article(
                title: "Senzacionalno otkriće u Singapuru!",
                description: "Znanstvenici su otkrili uzročnika jedne od najsmrtonosnijih bolesti na svijetu!",
                content: "Detaljan sadrzaj clanka...",
                image_url: URL(string: "https://images.stockcake.com/public/d/c/3/dc338251-bbd5-46f9-9b2a-53fdd013f6e2_large/scientist-examining-sample-stockcake.jpg")!,
                publishedAt: Date(),
                author: nil,
                category: .Svijet(.Znanost),
                ratings: [4, 4, 3]
            ),
            Article(
                title: "Pratite najnovije vijesti s Bliskog istoka",
                description: "Primirje na Bliskom istoku i dalje se održava usprkos prijetnjama brojnih stranih aktera...",
                content: "Detaljan sadržaj...",
                image_url: URL(string: "https://gdb.rferl.org/4c2f518e-2225-4860-bd2e-96b04fd462c8_cx25_cy0_cw50_w408_h510.jpg")!,
                publishedAt: Date(),
                author: nil,
                category: .Svijet(.Politika),
                ratings: []
            ),
            Article(
                title: "OVDJE pratite prijenos utrke Formule 1 iz Miamija",
                description: "Primirje na Bliskom istoku i dalje se održava usprkos prijetnjama brojnih stranih aktera...",
                content: "Detaljan sadržaj...",
                image_url: URL(string: "https://media.formula1.com/image/upload/v1741001071/proposition-page/Images/PremiumProVideoPlaceholder.jpg")!,
                publishedAt: Date(),
                author: nil,
                category: .Sport(.F1),
                ratings: []
            ),
            Article(
                title: "Iz minute u minutu",
                description: "Britanski premijer Keir Starmer u srijedu je najavio povećanje...",
                content: "Detaljan sadržaj...",
                image_url: URL(string: "https://cdn.britannica.com/40/259340-050-1566ABD1/Keir-Starmer-Prime-Minister-United-Kingdom-outside-10-Downing-Street-London-July-5-2024.jpg")!,
                publishedAt: Date(),
                author: nil,
                category: .Svijet(.Politika),
                ratings: []
            ),
            Article(
                title: "Najnovije vijesti dana",
                description: "Primirje na Bliskom istoku, sastanak predsjednika, utrka Formule..",
                content: "Detaljan sadržaj...",
                image_url: URL(string: "https://i.guim.co.uk/img/media/b00ad55575a70a9474aafbea637d212a927cc66b/437_0_4783_3827/master/4783.jpg?width=465&dpr=1&s=none&crop=none")!,
                publishedAt: Date(),
                author: nil,
                category: .Svijet(nil),
                ratings: []
            )
        ]
    
    
}
enum Category: Equatable{
    case Sport(SportSubcategory?)
    case Lifestyle(LifestyleSubcategory?)
    case Svijet(SvijetSubcategory?)
}
    
enum SportSubcategory: Equatable{
    case Nogomet, Tenis, Košarka, Rukomet, F1
}

enum LifestyleSubcategory: Equatable{
    case Kultura, Putovanja, Kuhanje
}

enum SvijetSubcategory: Equatable{
    case Politika, Ekonomija, Znanost
}

extension Category {
    var color: Color {
        switch self {
        case .Sport: return .green
        case .Lifestyle: return .orange
        case .Svijet: return .red
        }
    }
    
    var text: String {
        switch self {
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
}

