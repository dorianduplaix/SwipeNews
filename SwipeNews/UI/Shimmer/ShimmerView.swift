//
//  ShimmerView.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 26/03/2024.
//

import SwiftUI

public struct ShimmerView: View {
    private var hasCircle: Bool
    
    public init(hasCircle: Bool) {
        self.hasCircle = hasCircle
    }
    
    public var body: some View {
        HStack {
            circle
            VStack(alignment: .leading, spacing: .space1) {
                RoundedRectangle(cornerRadius: 4)
                    .frame(height: 10)
                RoundedRectangle(cornerRadius: 4)
                    .frame(height: 10)
                    .padding(.trailing, 50)
                RoundedRectangle(cornerRadius: 4)
                    .frame(height: 10)
                    .padding(.trailing, 100)
            }
        }
        .shimmerEffect(.init(tint: Color.customBlueLight, highlight: .white, blur: 5))
    }
    
    @ViewBuilder
    var circle: some View {
        if hasCircle {
            Circle()
                .frame(width: 40, height: 40)
        }
    }
}

#Preview {
    ShimmerView(hasCircle: true)
}
