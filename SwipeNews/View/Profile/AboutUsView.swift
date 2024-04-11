//
//  AboutUsView.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 11/04/2024.
//

import SwiftUI

struct AboutUsView: View {
    private let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    private let bundleNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
    
    var body: some View {
        VStack {
            image
            Text("SwipeNews")
            Text("Version \(appVersion ?? "") (\(bundleNumber ?? ""))")
                .font(.footnote)
        }
        .foregroundStyle(Color.customBluePrimary)
    }
    
    @ViewBuilder
    private var image: some View {
        if let appIcon = Image.appIcon() {
            appIcon
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(20)
        }
    }
}

#Preview {
    AboutUsView()
}
