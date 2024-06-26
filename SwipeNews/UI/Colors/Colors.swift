//
//  Colors.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 26/03/2024.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension Color {
    static let customYellow = Color(hex: "FFF2C5")
    static let customBlueLight = Color(hex: "D0F1FF")
    static let customBluePrimary = Color(hex: "209fd5")
    static let customPink = Color(hex: "FFE8E5")
    static let customWhite = Color(hex: "FFFFFF")
    static let customDark = Color(hex: "111111")
    static let shimmerGrey = Color(hex: "FFFFFF").opacity(0.9)
    static let customGrey = Color(hex: "555555")
    static let customLightGrey = Color(hex: "555555").opacity(0.8)
}
