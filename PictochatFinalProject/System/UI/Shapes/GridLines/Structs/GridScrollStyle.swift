//
//  GridScrollStyle.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/14/26.
//

import SwiftUI

/// A style describing direction and speed to scroll a grid
struct GridScrollStyle {
    /// The angle in degrees to scroll the grid in
    var scrollAngle: Angle,
    /// The amount to move the grid in the direction of the scroll
        scrollSpeed: CGFloat
    
    /// Is the grid scrolling?
    var isScrolling: Bool {
        scrollSpeed != .zero
    }
    
    init(scrollAngle: Angle = Angle(degrees: 0),
         scrollSpeed: CGFloat = 0) {
        self.scrollAngle = scrollAngle
        self.scrollSpeed = scrollSpeed
    }
    
    /// No scrolling
    static let none = GridScrollStyle(scrollAngle: .zero,
                                      scrollSpeed: .zero)
}
