//
//  BookmarkedItem.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 10/04/2024.
//

import SwiftUI

struct BookmarkedItem: View {
    @Environment(\.colorScheme) private var colorScheme
    var article: Article
    
    var body: some View {
            HStack(alignment: .center) {
                image
                    .padding(.leading, 0)
                
                VStack(alignment: .leading, spacing: .space1) {
                    Text("\(article.source.name) > \(date)")
                        .foregroundStyle(Color.customGrey)
                        .font(.caption2)
                        .bold()
                        .lineLimit(1)
                    
                    Text("\(article.title)")
                        .font(.subheadline)
                }
                .padding(.leading, .space1)
                
                Spacer()
            }
    }
    
    @ViewBuilder
    private var image: some View {
        AsyncImage(
            url: URL(string: article.urlToImage ?? ""),
            content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 90, height: 90)
                    .cornerRadius(10)
            },
            placeholder: {
                EmptyView()
            }
        )
    }
    
    private var date: String {
        return DateFormatter().formattedDateString(from: article.publishedAt)
    }
}

#Preview {
    BookmarkedItem(article: Article(source: Source(name: "Tkt frère"),
                                    author: "La chouchoute",
                                    title: "Beaucoup de pluie aujourd'hui, Beaucoup de pluie aujourd'hui, Beaucoup de pluie aujourd'hui",
                                    description: "Aujourd'hui il fait vraiment super moche. C'est assez relou, j'ai une flemme assez énorme de me rendre sur mon lieu de travail pour ne rien faire avec un temps pareil.",
                                    url: "https://arstechnica.com/tech-policy/2024/03/bitcoin-price-hits-record-69k-after-sec-approvals-fueled-7b-in-investments/",
                                    urlToImage: "https://cdn.arstechnica.net/wp-content/uploads/2024/03/GettyImages-1872368024-760x380.jpg",
                                    publishedAt: "2024-03-05T19:07:13Z",
                                    content: "Aujourd'hui il fait vraiment super moche. C'est assez relou, j'ai une flemme assez énorme de me rendre sur mon lieu de travail pour ne rien faire avec un temps pareil."))
}
