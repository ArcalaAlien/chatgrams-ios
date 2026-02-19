//
//  GridLines.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/14/26.
//

import SwiftUI

struct GridLines: View {
    // MARK: - VARS
    var gridStyle: GridLineStyle
    var scrollStyle: GridScrollStyle
    var gridOffset: CGPoint = .zero
    
    @State private var startTime: Date
    
    // MARK: - CONSTRUCTOR
    init(gridStyle: GridLineStyle = GridLineStyle(),
         scrollStyle: GridScrollStyle = .none,
         gridOffset: CGPoint = .zero) {
        self.gridStyle = gridStyle
        self.scrollStyle = scrollStyle
        self.gridOffset = gridOffset
        self.startTime = Date.now
    }
    
    // MARK: - BODY
    var body: some View {
        // Ensure the animation runs at 60 fps no mater what
        // even if other views are over it.
        TimelineView(.animation(minimumInterval: 1.0/60.0, paused: false)) { timeline in
            Canvas { frame, size in
                var camera = GridLineCamera(position: .zero,
                                            scrollStyle: scrollStyle,
                                            offset: gridOffset)
                
                let gridLines = GridLineRenderer(cellSize:gridStyle.cellSize, bounds: size)
                
                camera = camera.scroll(timeline.date.timeIntervalSince(startTime))
                frame.stroke(gridLines.draw(camera: camera),
                             with: gridStyle.lineShading,
                             style: gridStyle.stroke)
            }
        }
    } // end of Body
    
    // MARK: - PROPERTY WRAPPERS
    func gridStyle(_ style: GridLineStyle) -> GridLines {
        return GridLines(gridStyle: style,
                         scrollStyle: self.scrollStyle,
                         gridOffset: self.gridOffset)
    }
    
    func scrollStyle(_ style: GridScrollStyle) -> GridLines {
        return GridLines(gridStyle: self.gridStyle,
                         scrollStyle: style,
                         gridOffset: self.gridOffset)
    }
    
    func gridOffset(_ offset: CGPoint) -> GridLines {
        return GridLines(gridStyle: self.gridStyle,
                         scrollStyle: self.scrollStyle,
                         gridOffset: offset)
    }
    
    func cellSize(_ size: CGSize) -> GridLines {
        var styleCopy = gridStyle
        styleCopy.cellSize = size
        return GridLines(gridStyle: styleCopy,
                         scrollStyle: self.scrollStyle,
                         gridOffset: self.gridOffset)
    }
    
    func lineShading(_ shading: GraphicsContext.Shading) -> GridLines {
        var styleCopy = gridStyle
        styleCopy.lineShading = shading
        return GridLines(gridStyle: styleCopy,
                         scrollStyle: self.scrollStyle,
                         gridOffset: self.gridOffset)
    }
    
    func stroke(_ style: StrokeStyle) -> GridLines {
        var styleCopy = gridStyle
        styleCopy.stroke = style
        return GridLines(gridStyle: styleCopy,
                         scrollStyle: self.scrollStyle,
                         gridOffset: self.gridOffset)
    }
    
    func scrollAngle(angle: Angle) -> GridLines {
        var styleCopy = scrollStyle
        styleCopy.scrollAngle = angle
        return GridLines(gridStyle: self.gridStyle,
                         scrollStyle: styleCopy,
                         gridOffset: self.gridOffset)
    }
    
    func scrollSpeed(speed: CGFloat) -> GridLines {
        var styleCopy = scrollStyle
        styleCopy.scrollSpeed = speed
        return GridLines(gridStyle: self.gridStyle,
                         scrollStyle: styleCopy,
                         gridOffset: self.gridOffset)
    }
}

// MARK: - PREVIEW
#Preview {
    GridLines(  gridStyle: GridLineStyle(),
                scrollStyle: GridScrollStyle(scrollAngle: Angle(degrees: 20), scrollSpeed: -10),
                gridOffset: CGPoint(x: .zero, y: -30))
}
