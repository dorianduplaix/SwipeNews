//
//  ShimmerEffectHelper.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 26/03/2024.
//

import SwiftUI

public extension View {
    @ViewBuilder
    func shimmerEffect(_ config: ShimmerConfig) -> some View {
        self.modifier(ShimmerEffectHelper(config: config))
    }
}

public struct ShimmerConfig {
    var tint: Color
    var highlight: Color
    var blur: CGFloat
    var highlightOpacity: CGFloat
    var speed: CGFloat = 2
    
    public init(tint: Color, highlight: Color, blur: CGFloat = 0, highlightOpacity: CGFloat = 1, speed: CGFloat = 2) {
        self.tint = tint
        self.highlight = highlight
        self.blur = blur
        self.highlightOpacity = highlightOpacity
        self.speed = speed
    }
}

struct ShimmerEffectHelper: ViewModifier {
    // moveTo is the position from where animation begins and ends
    // -0.7 when view is build and update to 0.7 when view appears with repeatForever linear animation
    @State private var moveTo: CGFloat = -0.7
    var config: ShimmerConfig
    
    func body(content: Content) -> some View {
        content
            .hidden()
            .overlay {
                Rectangle()
                    .fill(config.tint)
                    .mask {
                        content
                    }
                    .overlay {
                        container
                            .mask {
                                content
                            }
                    }
                    .onAppear {
                        DispatchQueue.main.async {
                            moveTo = 0.7
                        }
                    }
                    .animation(.linear(duration: config.speed).repeatForever(autoreverses: false), value: moveTo)
            }
    }
    
    @ViewBuilder
    private var container: some View {
        GeometryReader {
            let size = $0.size
            let extraOffset = size.height * 2
            
            rectangleHighlight
                .offset(x: moveTo > 0 ? extraOffset : -extraOffset)
                .offset(x: size.width * moveTo)
        }
    }
    
    @ViewBuilder
    private var rectangleHighlight: some View {
        let gradientColors: [Color] = [
            Color.white.opacity(0),
            config.highlight.opacity(config.highlightOpacity),
            Color.white.opacity(0)
        ]
        
        Rectangle()
            .fill(config.highlight)
            .mask {
                Rectangle()
                    .fill(
                        .linearGradient(colors: gradientColors,
                                        startPoint: .top,
                                        endPoint: .bottom)
                    )
                    .blur(radius: config.blur)
                    .rotationEffect(.init(degrees: -30))
            }
    }
}
