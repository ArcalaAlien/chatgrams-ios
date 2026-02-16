//
//  GridLines.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/14/26.
//

import SwiftUI

struct GridLines: View {
    // MARK: - VARS
    var gridStyle: GridStyle
    var scrollStyle: GridScrollStyle
    
    private let startTime: Date
    
    // MARK: - CONSTRUCTOR
    init(gridStyle: GridStyle = GridStyle(),
         scrollStyle: GridScrollStyle = .none) {
        self.gridStyle = gridStyle
        self.scrollStyle = scrollStyle
        
        self.startTime = Date.now
    }
    
    // MARK: - BODY
    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { frame, size in
                var camera = GridLineCamera(position: .zero,
                                            scrollStyle: scrollStyle)
                
                let gridLines = GridLineRenderer(cellSize: gridStyle.cellSize,
                                                 bounds: size)
                
                camera = camera.scroll(timeline.date.timeIntervalSince(startTime))
                frame.stroke(gridLines.draw(camera: camera),
                             with: gridStyle.lineShading,
                             style: gridStyle.stroke)
            }
        }
    } // end of Body
    
    // MARK: - MUTATORS
    func gridStyle(style: GridStyle) -> GridLines {
        return GridLines(gridStyle: style,
                         scrollStyle: self.scrollStyle)
    }
    
    func scrollStyle(style: GridScrollStyle) -> GridLines {
        return GridLines(gridStyle: self.gridStyle,
                         scrollStyle: style)
    }
}

// MARK: - PREVIEW
#Preview {
    GridLines(  gridStyle: GridStyle(),
                scrollStyle: GridScrollStyle(scrollAngle: Angle(degrees: 0), scrollSpeed: 10))
}
