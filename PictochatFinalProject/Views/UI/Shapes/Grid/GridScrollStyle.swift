//
//  GridScrollStyle.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/14/26.
//

import SwiftUI

/// A style describing direction and speed to scroll a grid
struct GridScrollStyle {
    /// The angle in degrees to scroll the grid in
    var scrollAngle: CGFloat,
    /// The amount to move the grid in the direction of the scroll
        scrollSpeed: CGFloat
    
    /// Is the grid scrolling?
    var isScrolling: Bool {
        scrollSpeed != .zero
    }
    
    init() {
        scrollAngle = .zero
        scrollSpeed = .zero
    }
    
    init(scrollAngle: CGFloat) {
        self.scrollAngle = scrollAngle
        self.scrollSpeed = .zero
    }
    
    init(scrollSpeed: CGFloat) {
        self.scrollAngle = .zero
        self.scrollSpeed = scrollSpeed
    }
    
    init(scrollAngle: CGFloat, scrollSpeed: CGFloat) {
        self.scrollAngle = scrollAngle
        self.scrollSpeed = scrollSpeed
    }
    
    /// No scrolling
    static let none = GridScrollStyle(scrollAngle: .zero,
                                      scrollSpeed: .zero)
}
