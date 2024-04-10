//
//  ProfileItem.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 07/04/2024.
//

import SwiftUI

struct ProfileItem: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var notificationsOn = false
    var item: ProfileAsset
    var value: String = ""
    
    var body: some View {
        HStack {
            HStack(spacing: .space4) {
                HStack {
                    icon
                }
                .frame(width: 20)
                
                Text(item.title)
                    .fixedSize(horizontal: true, vertical: false)
            }
            
            rightSide
        }
        .font(.subheadline)
        .foregroundStyle(colorScheme == .dark ? Color.customWhite : Color.customDark)
    }
    
    @ViewBuilder
    var icon: some View {
        if item == .aboutUs {
            item.icon
                .resizable()
                .frame(width: 22, height: 22)
                .cornerRadius(20)
        } else {
            item.icon
                .foregroundStyle(Color.customBluePrimary)
        }
    }
    
    @ViewBuilder
    var rightSide: some View {
        Spacer()
        if item.withSwitch {
            Toggle("", isOn: $notificationsOn)
        } else {
            Text(value)
                .foregroundStyle(colorScheme == .dark ? Color.shimmerGrey : Color.customLightGrey)
                .lineLimit(1)
        }
    }
}

#Preview {
    VStack(alignment: .leading) {
        ProfileItem(item: .bookmarkedArticles)
        ProfileItem(item: .aboutUs)
    }
}
