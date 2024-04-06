//
//  Card.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 28/03/2024.
//

import SwiftUI

struct CardView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State var bookmarked = false
    @State private var isBlured = false
    @State private var isAuthorHidden = true
    
    var article: Article
    var onCardTap: () -> ()
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .shadow(color: Color.gray.opacity(0.5), radius: 1)
            
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [backgroundColor, backgroundColor]),
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing)
                        .ignoresSafeArea()
                        
                        image
                            .blur(radius: blurRadius)
                            .animation(.default, value: isBlured)
                            .mask(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        backgroundColor,
                                        backgroundColor,
                                        backgroundColor,
                                        backgroundColor.opacity(0)
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom)
                            )
                    }
                    .frame(width: geometry.size.width, height: 2/3 * geometry.size.height)
                    
                    backgroundColor
                }
                .cornerRadius(10)
            }
            
            informationContent
                .foregroundColor(Color.customWhite)
                .padding(.bottom, .space4)
            
            authorInformationContent
                .padding(EdgeInsets(top: .space2, leading: .space2, bottom: 0, trailing: 0))
        }
        .padding(.horizontal, .space4)
        .onTapGesture {
            onCardTap()
        }
    }
    
    @ViewBuilder
    private var image: some View {
        AsyncImage(
            url: URL(string: article.urlToImage ?? ""),
            content: { image in
                image
                    .resizable()
                    .scaledToFill()
            },
            placeholder: {
                ProgressView()
            }
        )
    }
    
    @ViewBuilder
    private var informationContent: some View {
        VStack {
            Spacer()
            
            VStack(spacing: .space6) {
                descriptionContent
                    .padding(.horizontal, .space4)
                
                footerContent
                    .padding(.horizontal, .space4)
            }
        }
    }
    
    @ViewBuilder
    private var descriptionContent: some View {
        VStack(alignment: .leading) {
            Text(article.title)
                .font(.title)
                .bold()
                .fixedSize(horizontal: false, vertical: true)
                .padding(.bottom, .space1)
            
            Text(article.description ?? "")
                .font(.subheadline)
                .lineLimit(3)
                .foregroundStyle(Color.shimmerGrey)
        }
    }
    
    @ViewBuilder
    private var footerContent: some View {
        VStack(spacing: .space2) {
            Divider()
                .overlay(Color.shimmerGrey)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(article.source.name)
                    Text(date)
                }
                .foregroundStyle(Color.shimmerGrey)
                .font(.caption2)
                
                Spacer()
                
                actionButtons
            }
        }
    }
    
    @ViewBuilder
    private var actionButtons: some View {
        HStack(spacing: .space6) {
            bookmarkIcon
                .onTapGesture {
                    bookmarked.toggle()
                }
            
            Image(systemName: "square.and.arrow.up")
        }
        .foregroundStyle(Color.customBluePrimary)
        .padding(.trailing, .space3)
    }
    
    @ViewBuilder
    private var authorInformationContent: some View {
        HStack {
            Image(systemName: "info.circle.fill")
                .foregroundStyle(Color.shimmerGrey)
                .onTapGesture {
                    isBlured.toggle()
                    isAuthorHidden.toggle()
                }
            
            Text("(\(article.author ?? ""))")
                .foregroundStyle(Color.shimmerGrey)
                .opacity(isAuthorHidden ? 0 : 1)
                .font(.caption2)
                .animation(.default, value: isAuthorHidden)
            
        }
    }
    
    private var backgroundColor: Color {
        colorScheme == .dark ? Color.customGrey : Color.customDark
    }
    
    private var date: String {
        return DateFormatter().formattedDateString(from: article.publishedAt)
    }
    
    private var bookmarkIcon: Image {
        bookmarked ? Image(systemName: "bookmark.fill") : Image(systemName: "bookmark")
    }
    
    private var blurRadius: CGFloat {
        isBlured ? 20 : 0
    }
}

#Preview {
    CardView(article: Article(source: Source(name: "Tkt frère"),
                              author: "La chouchoute",
                              title: "Beaucoup de pluie aujourd'hui",
                              description: "Aujourd'hui il fait vraiment super moche. C'est assez relou, j'ai une flemme assez énorme de me rendre sur mon lieu de travail pour ne rien faire avec un temps pareil.",
                              url: "https://arstechnica.com/tech-policy/2024/03/bitcoin-price-hits-record-69k-after-sec-approvals-fueled-7b-in-investments/",
                              urlToImage: "https://cdn.arstechnica.net/wp-content/uploads/2024/03/GettyImages-1872368024-760x380.jpg",
                              publishedAt: "2024-03-05T19:07:13Z",
                              content: "Aujourd'hui il fait vraiment super moche. C'est assez relou, j'ai une flemme assez énorme de me rendre sur mon lieu de travail pour ne rien faire avec un temps pareil."),
             onCardTap: {print("onTapCard")})
}
