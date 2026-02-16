//
//  GridLineRenderer.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/16/26.
//

import SwiftUI

struct GridLineRenderer {
    var cellSize: CGSize
    var bounds: CGSize
    
    init(cellSize: CGSize,
         bounds: CGSize) {
        self.cellSize = cellSize
        self.bounds = bounds
    }
    
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
        let sizeX: CGFloat = cellSize.width,
            sizeY: CGFloat = cellSize.height,
            frameH: CGFloat = bounds.height,
            frameW: CGFloat = bounds.width,
            cameraX: CGFloat = camera.position.x,
            cameraY: CGFloat = camera.position.y,
            isScrolling: Bool = camera.scrollStyle.isScrolling
        
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
                         (-cameraX / sizeX) * sizeX + cameraX : -5,
            lineSpawnY = isScrolling ?
                         (-cameraY / sizeY) * sizeY + cameraY : -5
        
        // Set up our path for drawing
        var gridPath = Path()
        
        // Do this for every grid row
        for rows in stride(from: lineSpawnY, // Offscreen Y start
                           to:   frameH,     // Full View height
                           by:   sizeY) {    // Step by the Y size of the cell.
            
            // Now we add a grid line
            gridPath.move(to: CGPoint(x: 0, y: rows))
            gridPath.addLine(to: CGPoint(x: frameW + 5, y: rows))
        }
        
        // Do this for every grid column
        for columns in stride(from: lineSpawnX, // Offscreen X start
                              to: frameW,       // Full View width
                              by: sizeX) {      // Step by the X size of the cell.
            
            // Now we add a grid line
            gridPath.move(to: CGPoint(x: columns, y: 0))
            gridPath.addLine(to: CGPoint(x: columns, y: frameH + 5))
        }
        
        // We've finished drawing the grid!
        return gridPath
    }
}
