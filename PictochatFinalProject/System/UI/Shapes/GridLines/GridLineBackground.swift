//
//  GridLineBackground.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/5/26.
//

import SwiftUI

struct GridLineBackground: View {
    var topGridStyle: GridLineStyle,
        bottomGridStyle: GridLineStyle
    
    private var bottomLayer: GridLines,
                 topLayer: GridLines
    
    @State private var parentFrameSize: CGSize
    
    init() {
        topGridStyle = GridLineStyle()
        bottomGridStyle = GridLineStyle()
        bottomLayer = GridLines()
        topLayer = GridLines()
        parentFrameSize = CGSize(width: 100, height: 100)
    }
    
    init(topGridStyle: GridLineStyle,
         bottomGridStyle: GridLineStyle,
         parentFrameSize: CGSize) {
        self.topGridStyle = topGridStyle
        self.bottomGridStyle = bottomGridStyle
        self.parentFrameSize = parentFrameSize
        bottomLayer = GridLines()
        topLayer = GridLines()
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                

                bottomLayer
                    .gridStyle(bottomGridStyle)
                topLayer
                    .gridStyle(topGridStyle)
                

            }.task {
                parentFrameSize = geo.size
            }
            .compositingGroup()
        }
        .background(Color.clear)
    }
}

#Preview {
    PreviewContainer {
        GeometryReader { geo in
            var bg = GridLineBackground(topGridStyle: GridLineStyle(),
                                        bottomGridStyle: GridLineStyle(),
                                        parentFrameSize: geo.size)
            
            bg
        }
    }
}
