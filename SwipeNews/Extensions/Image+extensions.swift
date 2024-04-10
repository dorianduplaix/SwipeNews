//
//  Image+extensions.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 09/04/2024.
//

import SwiftUI

extension Image {
    static func appIcon() -> Image? {
        guard let iconsDictionary = Bundle.main.infoDictionary?["CFBundleIcons"] as? [String: Any],
              let primaryIconsDictionary = iconsDictionary["CFBundlePrimaryIcon"] as? [String: Any],
              let iconFiles = primaryIconsDictionary["CFBundleIconFiles"] as? [String],
              let lastIcon = iconFiles.last else {
            return nil
        }
        
        if let icon = UIImage(named: lastIcon) {
            return Image(uiImage: icon)
        }
        
        return nil
    }
}
