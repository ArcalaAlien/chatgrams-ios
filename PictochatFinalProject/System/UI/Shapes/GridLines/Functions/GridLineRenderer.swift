//
//  GridLineRenderer.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/16/26.
//

import SwiftUI

struct GridLineRenderer {
    let cellSize: CGSize
    let bounds: CGSize
    
    func cellSize(_ size: CGSize) -> GridLineRenderer {
        GridLineRenderer(cellSize: size,
                         bounds: bounds)
    }
    
    func bounds(_ size: CGSize) -> GridLineRenderer {
        GridLineRenderer(cellSize:       cellSize,
                         bounds:         size)
    }
    
    func draw(camera: GridLineCamera) -> Path {
        // Handy constants!
        let frameH: CGFloat = normalizeValue(self.bounds.height),
            frameW: CGFloat = normalizeValue(self.bounds.width),
            sizeX: CGFloat = normalizeValue(self.cellSize.width),
            sizeY: CGFloat = normalizeValue(self.cellSize.height),
            isScrolling: Bool = camera.scrollStyle.isScrolling
        
        guard (frameH.isFinite && frameH > 0) else {
            print("FrameH \(frameH) was invalid!")
            return Path()
        }
        
        guard (frameW.isFinite && frameW > 0) else {
            print("FrameW \(frameW) was invalid!")
            return Path()
        }
        
        guard (frameH.isFinite && frameH > 0) else {
            print("sizeX \(sizeX) was invalid!")
            return Path()
        }
         
        guard (frameH.isFinite && frameH > 0) else {
            print("sizeY \(sizeY) was invalid!")
            return Path()
        }
        
        let cameraX = camera.position.x,
            cameraY = camera.position.y
        // Here we get the starting position
        // to draw from for each axis
        //
        // If we are scrolling then we need to get
        // the starting position of the x and y axis.
        // This is OFFSCREEN to give the illusion of
        // an infinite scrolling plane
        //
        // Otherwise, we draw from just off the top of the screen
        let lineSpawnX = isScrolling ?
        floor((-cameraX / sizeX)) * sizeX + cameraX : -5,
            lineSpawnY = isScrolling ?
                         floor((-cameraY / sizeY)) * sizeY + cameraY : -5
        
        // Set up our path for drawing
        var gridPath = Path()
        
        // Do this for every grid row
        for rows in stride(from: lineSpawnY, // Offscreen Y start
                           to:   frameH,     // Full View height
                           by:   sizeY) {    // Step by the Y size of the cell.
            
            //print("Drawing row!")
            // Now we add a grid line
            gridPath.move(to: CGPoint(x: 0, y: rows))
            gridPath.addLine(to: CGPoint(x: frameW + 5, y: rows))
        }
        
        // Do this for every grid column
        for columns in stride(from: lineSpawnX, // Offscreen X start
                              to: frameW,       // Full View width
                              by: sizeX) {      // Step by the X size of the cell.
            
            //print("Drawing columns!")
            // Now we add a grid line
            gridPath.move(to: CGPoint(x: columns, y: 0))
            gridPath.addLine(to: CGPoint(x: columns, y: frameH + 5))
        }
        
        // We've finished drawing the grid!
        return gridPath
    }
    
    private func normalizeValue(_ number: CGFloat) -> CGFloat {
        if (!number.isFinite || number.isZero) {
            print("Value \(number) was invalid2!")
            return 1
        }
        
        return number
    }
}
