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
    
    func scroll(_ elapsedTime: TimeInterval) -> GridLineCamera {
        if (!scrollStyle.isScrolling) {
            return self
        }
        
        let speed: CGFloat = scrollStyle.scrollSpeed,
            angle: Angle = scrollStyle.scrollAngle
        
        var nextPosition: CGPoint = .zero
        nextPosition.x = position.x + speed * cos(angle.radians) * CGFloat(elapsedTime)
        nextPosition.y = position.y + speed * sin(angle.radians) * CGFloat(elapsedTime)
            
        return GridLineCamera(position: nextPosition,
                              scrollStyle: scrollStyle)
    }
}
