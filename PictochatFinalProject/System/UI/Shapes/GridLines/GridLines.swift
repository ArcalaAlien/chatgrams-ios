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
    
    init(_ gridStyle: GridLineStyle = GridLineStyle()) {
        self.gridStyle = gridStyle
    }
    
    @State private var startTime: Date = Date.now
    
    // MARK: - BODY
    var body: some View {
        // Ensure the animßation runs at 60 fps no mater what
        // even if other views are over it.
        TimelineView(
            .animation(minimumInterval: 1.0/60.0, paused: false)) { timeline in
                Canvas { frame, size in
                    let renderer: GridLineRenderer = GridLineRenderer(
                        cellSize: gridStyle.cellSize,
                        bounds: size)
                    
                    let camera: GridLineCamera = GridLineCamera(
                        position: gridStyle.cameraPosition,
                        scrollStyle: gridStyle.scrollStyle,
                        offset: gridStyle.cameraOffset
                    ).scroll(timeline.date.timeIntervalSince(startTime))
                    
                    frame.stroke(renderer.draw(camera: camera),
                                 with: gridStyle.lineShading,
                                 style: gridStyle.gridStroke)
                } // end of canvas
        } // end of timeline view
    }// end of Body
    
    func gridStyle(_ style: GridLineStyle) -> GridLines {
        var copy = self
        copy.gridStyle = style
        return copy
    }
}

// MARK: - PREVIEW
#Preview {
    GeometryReader { geo in
        GridLines(
            GridLineStyle()
                .cellSize(CGSize(width: 128, height: 128))
                .lineShading(.color(.black)))
    }.frame(width: 300, height: 300)
        .background(.red)
}
