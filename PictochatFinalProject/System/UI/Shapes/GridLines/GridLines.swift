//
//  GridLines.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/14/26.
//

import SwiftUI

struct GridLines: View {
    // MARK: - VARS
    var gridStyle: GridLineStyle = GridLineStyle()
    
    @State private var startTime: Date = Date.now
    @State private var camera: GridLineCamera = GridLineCamera(position: .zero, scrollStyle: .none)
    @State private var renderer: GridLineRenderer = GridLineRenderer(cellSize: .zero, bounds: .zero)
    
    // MARK: - BODY
    var body: some View {
        // Ensure the animation runs at 60 fps no mater what
        // even if other views are over it.
        TimelineView(
            .animation(minimumInterval: 1.0/60.0, paused: false)) { timeline in
                Canvas { frame, size in
                    camera = GridLineCamera(
                        position: gridStyle.cameraPosition,
                        scrollStyle: gridStyle.scrollStyle,
                        offset: gridStyle.cameraOffset
                    ).scroll(timeline.date.timeIntervalSince(startTime))
                    
                    renderer = GridLineRenderer(
                        cellSize: gridStyle.cellSize,
                        bounds: size
                    )
                    
                    frame.stroke(renderer.draw(camera: camera),
                                 with: gridStyle.lineShading,
                                 style: gridStyle.gridStroke)
                } // end of canvas
        } // end of timeline view
    }// end of Body
}

// MARK: - PREVIEW
#Preview {
    GridLines()
}
