//
//  Card.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 28/03/2024.
//

import SwiftUI

struct CardView: View {
    var height: CGFloat = 200 // default height
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(Color.gray, lineWidth: 2)
            .frame(height: height)
            .padding()
            .overlay(
                VStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    Text("John Doe")
                        .font(.title)
                }
            )
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CardView()
}
