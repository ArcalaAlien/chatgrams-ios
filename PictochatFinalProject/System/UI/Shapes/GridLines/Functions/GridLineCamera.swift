//
//  GridLineCamera.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/16/26.
//

import SwiftUI

struct GridLineCamera {
    var position: CGPoint = .zero
    var offset: CGPoint = .zero
    var scrollStyle: GridScrollStyle = .none
    
    init(position: CGPoint,
         scrollStyle: GridScrollStyle,
         offset: CGPoint = .zero) {
        self.position = position
        self.scrollStyle = scrollStyle
        self.offset = offset
    }
    
    func scroll(_ elapsedTime: TimeInterval) -> GridLineCamera {
        if (!scrollStyle.isScrolling) {
            return self
        }
        
        let speed: CGFloat = scrollStyle.scrollSpeed,
            angle: Angle = scrollStyle.scrollAngle
        
        var nextPosition: CGPoint = .zero
        nextPosition.x = (position.x + offset.x) + speed * cos(angle.radians) * CGFloat(elapsedTime)
        nextPosition.y = (position.y + offset.y) + speed * sin(angle.radians) * CGFloat(elapsedTime)
        nextPosition = normalizeCameraPosition(nextPosition)
        
        return GridLineCamera(position: nextPosition,
                              scrollStyle: scrollStyle)
    }
    
    private func normalizeCameraPosition(_ cameraPosition: CGPoint) -> CGPoint {
        let cameraX = cameraPosition.x,
            cameraY = cameraPosition.y
        
        var adjustCameraX: CGFloat = cameraX,
            adjustCameraY: CGFloat = cameraY
        
        if (!cameraX.isFinite) {
            print("Camera X was invalid!")
            adjustCameraX = .zero
        }
        
        if (!cameraY.isFinite) {
            print("Camera Y was invalid!")
            adjustCameraY = .zero
        }

        return CGPoint(x: adjustCameraX, y: adjustCameraY)
    }
}
