//
//  GridLineCamera.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/16/26.
//

import SwiftUI

struct GridLineCamera {
    var position: CGPoint = .zero
    var scrollStyle: GridScrollStyle = .none
    
    init(position: CGPoint,
         scrollStyle: GridScrollStyle) {
        self.position = position
        self.scrollStyle = scrollStyle
    }
    
    func scroll(_ rate: TimeInterval) -> GridLineCamera {
        let nextX: CGFloat,
            nextY: CGFloat
        
        if (scrollStyle.isScrolling) {
            let speed: CGFloat = scrollStyle.scrollSpeed,
                angle: CGFloat = scrollStyle.scrollAngle
            
            nextX = position.x + (speed * cos(angle)) * rate
            nextY = position.y + (speed * sin(angle)) * rate
        } else {
            nextX = .zero
            nextY = .zero
        }
            
        return GridLineCamera(position: CGPoint(x: nextX, y: nextY),
                              scrollStyle: scrollStyle)
    }
}
