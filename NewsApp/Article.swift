//
//  Article.swift
//  NewsApp
//
//  Created by Matej Samaržija on 12.04.2026..
//

import SwiftUI

struct Article: Identifiable, Equatable, Codable{
    let id : String
    let title: String
    let description: String
    let content: String
    let image_url: URL
    let publishedAt: Date
    let author: String?
    let category: Category
    var isRead: Bool = false
    
    var ratings: [Int]
    
    var averageRating: Double {
        guard !ratings.isEmpty else { return 0 }
        return Double(ratings.reduce(0, +)) / Double(ratings.count)
    }
    
    static let mockArticles: [Article] = [
        Article(id: UUID().uuidString, title: "Dinamo pobijedio Hajduk",
                    description: "U derbiju sezone zagrebački Dinamo očekivano je svladao Splićane 4:0. Ova pobjeda gotovo je osigurala...",
                    content: "U velikom derbiju hrvatskog nogometa Dinamo je na Maksimiru uvjerljivo svladao Hajduk rezultatom 4:0. Od samog početka utakmice domaćin je nametnuo visok ritam i kontrolirao posjed lopte. Prvi pogodak pao je već u ranoj fazi susreta, što je dodatno otvorilo prostor za napade. Hajduk nije uspio pronaći odgovor na agresivnu igru Dinama, a obrana gostiju često je bila pod pritiskom. Ovom pobjedom Dinamo je napravio veliki korak prema osvajanju naslova prvaka, dok Hajduk mora tražiti priliku za iskupljenje u sljedećim kolima.",
                    image_url: URL(string: "https://image.dnevnik.hr/media/images/1296x640/Aug2019/61744692-hajduk--dinamo.jpg")!,
                    publishedAt: Date(),
                    author: "Ivan H.",
                    category: .Sport(.Nogomet),
                    ratings: [5, 4, 5]),
            Article(
                id: UUID().uuidString,
                title: "Modrić (40) osvojio Zlatnu loptu!",
                description: "Luka Modrić službeno je postao najstariji igrač koji osvojio prestižnu Zlatnu loptu.",
                content: "Luka Modrić još je jednom ispisao povijest svjetskog nogometa osvojivši Zlatnu loptu u 40. godini života. Njegova sezona bila je obilježena vrhunskim igrama, liderstvom na terenu i ključnim doprinosom u najvažnijim utakmicama. Stručnjaci ističu njegovu nevjerojatnu fizičku spremu i nogometnu inteligenciju koja mu omogućuje dominaciju i u poznim igračkim godinama. Ova nagrada potvrđuje njegov status jednog od najvećih veznjaka svih vremena i inspiracija je mladim igračima diljem svijeta.",
                image_url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/e/e9/ISL-HRV_%287%29.jpg")!,
                publishedAt: Date(),
                author: "Matej S.",
                category: .Sport(.Nogomet),
                ratings: [5, 4, 5]
            ),
            Article(
                id: UUID().uuidString,
                title: "Senzacionalno otkriće u Singapuru!",
                description: "Znanstvenici su otkrili uzročnika jedne od najsmrtonosnijih bolesti na svijetu!",
                content: "Znanstvenici iz Singapura objavili su revolucionarno otkriće koje bi moglo promijeniti način borbe protiv jedne od najsmrtonosnijih bolesti na svijetu. Nakon višegodišnjeg istraživanja uspjeli su identificirati ključni uzročnik koji pokreće razvoj bolesti na molekularnoj razini. Ovo otkriće otvara vrata razvoju novih lijekova i terapija koje bi mogle značajno smanjiti smrtnost. Stručna zajednica već sada govori o potencijalnom medicinskom proboju koji bi mogao spasiti milijune života u budućnosti.",
                image_url: URL(string: "https://images.stockcake.com/public/d/c/3/dc338251-bbd5-46f9-9b2a-53fdd013f6e2_large/scientist-examining-sample-stockcake.jpg")!,
                publishedAt: Date(),
                author: nil,
                category: .Svijet(.Znanost),
                ratings: [4, 4, 3]
            ),
            Article(
                id: UUID().uuidString,
                title: "OVDJE pratite prijenos utrke Formule 1 iz Miamija",
                description: "Utrka Formule 1 u Miamiju donosi uzbudljivu borbu najboljih vozača svijeta...",
                content: "Utrka Formule 1 u Miamiju donosi uzbudljivu borbu najboljih vozača svijeta na jednoj od najatraktivnijih staza u kalendaru. Kvalifikacije su već pokazale koliko su male razlike između vodećih momčadi, što najavljuje neizvjesnu utrku. Strategija, izbor guma i pravovremeni ulasci u boks bit će ključni faktori za konačni rezultat. Navijači mogu očekivati brojne pretjecaje i dramatične trenutke, a borba za vrh prvenstva dodatno podiže ulog ove utrke.",
                image_url: URL(string: "https://media.formula1.com/image/upload/v1741001071/proposition-page/Images/PremiumProVideoPlaceholder.jpg")!,
                publishedAt: Date(),
                author: nil,
                category: .Sport(.F1),
                ratings: []
            ),
            Article(
                id: UUID().uuidString,
                title: "Pratite najnovije vijesti s Bliskog istoka",
                description: "Primirje na Bliskom istoku i dalje se održava usprkos prijetnjama brojnih stranih aktera...",
                content: "Situacija na Bliskom istoku i dalje je napeta unatoč krhkom primirju koje se zasad održava. Diplomatki napori međunarodne zajednice usmjereni su na stabilizaciju regije i sprječavanje daljnje eskalacije sukoba. Iako se na terenu bilježi smanjenje intenziteta sukoba, političke tenzije i dalje su visoke. Analitičari upozoravaju da bi svaki manji incident mogao ponovno pokrenuti val nasilja. Građani u pogođenim područjima suočavaju se s neizvjesnošću i teškim životnim uvjetima.",
                image_url: URL(string: "https://gdb.rferl.org/4c2f518e-2225-4860-bd2e-96b04fd462c8_cx25_cy0_cw50_w408_h510.jpg")!,
                publishedAt: Date(),
                author: nil,
                category: .Svijet(.Politika),
                ratings: []
            ),
            Article(
                id: UUID().uuidString,
                title: "Iz minute u minutu",
                description: "Britanski premijer Keir Starmer u srijedu je najavio povećanje...",
                content: "Britanski premijer Keir Starmer najavio je niz novih mjera usmjerenih na jačanje gospodarstva i poboljšanje životnog standarda građana. Među najvažnijim najavama ističe se povećanje ulaganja u javne usluge i infrastrukturu. Oporba je odmah reagirala kritikama, tvrdeći da mjere nisu dovoljno konkretne. Politička scena u Ujedinjenom Kraljevstvu i dalje je vrlo dinamična, a građani s velikim zanimanjem prate razvoj događaja i moguće posljedice na svakodnevni život.",
                image_url: URL(string: "https://cdn.britannica.com/40/259340-050-1566ABD1/Keir-Starmer-Prime-Minister-United-Kingdom-outside-10-Downing-Street-London-July-5-2024.jpg")!,
                publishedAt: Date(),
                author: nil,
                category: .Svijet(.Politika),
                ratings: []
            ),
            Article(
                id: UUID().uuidString,
                title: "Najnovije vijesti dana",
                description: "Primirje na Bliskom istoku, sastanak predsjednika, utrka Formule..",
                content: "Današnji dan obilježile su brojne važne vijesti iz svijeta politike, sporta i međunarodnih odnosa. Primirje na Bliskom istoku i dalje je u fokusu svjetske javnosti, dok se istovremeno održavaju ključni sastanci političkih lidera. Na sportskom planu, uzbudljive utrke i nogometni derbiji privlače veliku pažnju gledatelja. Stručnjaci ističu kako se globalna situacija brzo mijenja, zbog čega je važno pratiti provjerene informacije i razumjeti širi kontekst događaja.",
                image_url: URL(string: "https://i.guim.co.uk/img/media/b00ad55575a70a9474aafbea637d212a927cc66b/437_0_4783_3827/master/4783.jpg?width=465&dpr=1&s=none&crop=none")!,
                publishedAt: Date(),
                author: nil,
                category: .Svijet(nil),
                ratings: []
            )
        ]
    
    
}
enum Category: Equatable, Codable{
    case Sport(SportSubcategory?)
    case Lifestyle(LifestyleSubcategory?)
    case Svijet(SvijetSubcategory?)
}
    
enum SportSubcategory: Equatable, Codable{
    case Nogomet, Tenis, Košarka, Rukomet, F1
}

enum LifestyleSubcategory: Equatable, Codable{
    case Kultura, Putovanja, Kuhanje
}

enum SvijetSubcategory: Equatable, Codable{
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

extension Article {
    init?(from dto: ArticleDTO) {
        guard let description = dto.description else { return nil }
        
        self.id = dto.article_id
        self.title = dto.title
        self.description = description
        self.content = description
        self.image_url = URL(string: dto.image_url ?? "") ?? URL(string: "https://placehold.co/400")!
        self.publishedAt = Date()
        self.author = dto.creator?.first
        self.category = .Svijet(nil)
        self.ratings = []
        self.isRead = false
    }
}
