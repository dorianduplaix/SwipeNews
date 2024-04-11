//
//  Spacing.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 26/03/2024.
//

import Foundation

fileprivate let defaultSizeDouble: Double = 16
fileprivate let defaultSizeFloat: Float = 16.0
fileprivate let defaultSizeCGFloat: CGFloat = 16.0

public extension Double {
    static let space1 = defaultSizeDouble * 0.25
    static let space2 = defaultSizeDouble * 0.5
    static let space3 = defaultSizeDouble * 0.75
    static let space4 = defaultSizeDouble
    static let space5 = defaultSizeDouble * 1.25
    static let space6 = defaultSizeDouble * 1.5
    static let space8 = defaultSizeDouble * 2
    static let space10 = defaultSizeDouble * 2.5
    static let space12 = defaultSizeDouble * 3
    static let space16 = defaultSizeDouble * 4
    static let space20 = defaultSizeDouble * 5
    static let space24 = defaultSizeDouble * 6
    static let space28 = defaultSizeDouble * 7
    static let space32 = defaultSizeDouble * 8
}

public extension Float {
    static let space1 = defaultSizeFloat * 0.25
    static let space2 = defaultSizeFloat * 0.5
    static let space3 = defaultSizeFloat * 0.75
    static let space4 = defaultSizeFloat
    static let space5 = defaultSizeFloat * 1.25
    static let space6 = defaultSizeFloat * 1.5
    static let space8 = defaultSizeFloat * 2
    static let space10 = defaultSizeFloat * 2.5
    static let space12 = defaultSizeFloat * 3
    static let space16 = defaultSizeFloat * 4
    static let space20 = defaultSizeFloat * 5
    static let space24 = defaultSizeFloat * 6
    static let space28 = defaultSizeFloat * 7
    static let space32 = defaultSizeFloat * 8
}

public extension CGFloat {
    static let space1 = defaultSizeCGFloat * 0.25
    static let space2 = defaultSizeCGFloat * 0.5
    static let space3 = defaultSizeCGFloat * 0.75
    static let space4 = defaultSizeCGFloat
    static let space5 = defaultSizeCGFloat * 1.25
    static let space6 = defaultSizeCGFloat * 1.5
    static let space8 = defaultSizeCGFloat * 2
    static let space10 = defaultSizeCGFloat * 2.5
    static let space12 = defaultSizeCGFloat * 3
    static let space16 = defaultSizeCGFloat * 4
    static let space20 = defaultSizeCGFloat * 5
    static let space24 = defaultSizeCGFloat * 6
    static let space28 = defaultSizeCGFloat * 7
    static let space32 = defaultSizeCGFloat * 8
}
