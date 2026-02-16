//
//  GridLines.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/14/26.
//

import SwiftUI

struct GridLines: View {
    // MARK: - VARS
    @State var gridStyle: GridStyle
    @State var scrollStyle: GridScrollStyle
    
    // MARK: - CONSTRUCTORS
    init () {
        gridStyle = GridStyle()
        scrollStyle = .none
    }
    
    init (gridStyle: GridStyle) {
        self.gridStyle = gridStyle
        scrollStyle = .none
    }
    
    init (scrollStyle: GridScrollStyle) {
        self.scrollStyle = scrollStyle
        gridStyle = GridStyle()
    }
    
    init(gridStyle: GridStyle = GridStyle(),
         scrollStyle: GridScrollStyle = .none) {
        self.gridStyle = gridStyle
        self.scrollStyle = scrollStyle
    }
    
    // MARK: - BODY
    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { frame, size in
                frame.stroke(
                    drawGridLines(
                            camera: scrollCamera(rate: (CGFloat)(timeline.date.timeIntervalSinceReferenceDate)),
                            frameSize: size),
                    with: gridStyle.lineShading,
                    style: gridStyle.stroke
                ) // end of stroke
            } // end of Canvas
        } // end of Timeline
    } // end of Body
    
    // MARK: - MUTATORS
    func gridStyle(style: GridStyle) -> GridLines {
        gridStyle = style
        return self
    }
    
    func scrollStyle(style: GridScrollStyle) -> GridLines {
        scrollStyle = style
        return self
    }
    
    // MARK: - drawGridLines INTERAL FUNCTION
    private func drawGridLines(camera: CGPoint, frameSize: CGSize) -> Path {
        // Handy constants!
        let sizeX: CGFloat = gridStyle.cellSize.width,
            sizeY: CGFloat = gridStyle.cellSize.height,
            cameraX: CGFloat = camera.x,
            cameraY: CGFloat = camera.y,
            frameH: CGFloat = frameSize.height,
            frameW: CGFloat = frameSize.width
        
        // Here we get the starting position
        // to draw from for each axis
        //
        // If we are scrolling then we need to get
        // the starting position of the x and y axis.
        // This is OFFSCREEN to give the illusion of
        // an infinite scrolling plane
        //
        // Otherwise, we draw from just off the top of the screen
        let lineSpawnX = scrollStyle.isScrolling ?
                         (-cameraX / sizeX) * sizeX + cameraX : -5,
            lineSpawnY = scrollStyle.isScrolling ?
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
    
    // MARK: - scrollCamera INTERNAL FUNCTION
    private func scrollCamera(rate: CGFloat) -> CGPoint {
        let speed: CGFloat = scrollStyle.scrollSpeed,
            angle: CGFloat = scrollStyle.scrollAngle,
            nextX: CGFloat = (speed * cos(angle)) * rate,
            nextY: CGFloat = (speed * sin(angle)) * rate
        
        return CGPoint(x: nextX, y: nextY)
    }
}

// MARK: - PREVIEW
#Preview {
    HStack{
        GridLines(scrollStyle: GridScrollStyle(scrollAngle: 45, scrollSpeed: 8))
    }
}
