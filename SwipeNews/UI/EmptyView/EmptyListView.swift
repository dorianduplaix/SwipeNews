//
//  EmptyListView.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 11/04/2024.
//

import SwiftUI

struct EmptyListView: View {
    var image: String
    var title: String
    var description: String
    
    var body: some View {
        VStack(spacing: .space4) {
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
            
            VStack(spacing: .space1) {
                Text(title)
                    .font(.title3)
                    .bold()
                
                Text(description)
                    .font(.caption2)
            }
        }
        .foregroundStyle(Color.customGrey)
    }
}

#Preview {
    EmptyListView(image: "bookmark",
                  title: "Aucun article sauvegardé",
                  description: "La liste des articles est sauvegardée sur votre iPhone.")
}
