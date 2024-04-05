//
//  DateFormatter+extension.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 05/04/2024.
//

import Foundation

extension DateFormatter {
    func formattedDateString(from dateString: String) -> String {
        self.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = self.date(from: dateString) {
            self.dateStyle = .long
            self.timeStyle = .short
            self.locale = Locale.current
            return self.string(from: date)
        } else {
            return "Invalid Date"
        }
    }
}
