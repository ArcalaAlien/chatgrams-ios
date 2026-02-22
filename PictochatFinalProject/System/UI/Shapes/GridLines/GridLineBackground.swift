//
//  GridLineBackground.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/5/26.
//

import SwiftUI

struct GridLineBackground: View {
    internal var bottomLayer: GridLines = GridLines(),
                 topLayer: GridLines = GridLines(),
                 bottomLayerShading: GraphicsContext.Shading,
                 topLayerShading: GraphicsContext.Shading
                 
    @State internal var parentFrameSize: CGSize = CGSize(width: 100, height: 100)
        
    init() {
        bottomLayerShading = .color(.black)
        topLayerShading = .color(.black)
        parentFrameSize = CGSize(width: 1, height: 1)
    }
    
    
    internal init(parentFrameSize: CGSize,
                  topShading: GraphicsContext.Shading,
                  bottomShading: GraphicsContext.Shading) {
        topLayerShading = topShading
        bottomLayerShading = bottomShading
    }
    
    var body: some View {
        GeometryReader { geo in
            let frameH = geo.size.height,
                frameW = geo.size.width
        
            ZStack {
                bottomLayer
                    .scrollStyle(GridScrollStyle(scrollAngle: Angle(degrees: -22.5),                                scrollSpeed: 10))
                    .cellSize(calculateCellSize(cellSize: CGSize(width: frameW / 3,
                                                                 height: frameH / 3),
                                                frameSize: geo.size))
                    .gridOffset(CGPoint(x: frameW / 5, y: .zero))
                    .lineShading(bottomLayerShading)
                
                topLayer
                    .scrollStyle(GridScrollStyle(scrollAngle: Angle(degrees: 45),
                                                 scrollSpeed: 17))
                    .cellSize(calculateCellSize(cellSize: CGSize(width: frameW / 3,
                                                                 height: frameH / 3),
                                                frameSize: geo.size))
                    .lineShading(topLayerShading)
            }.task {
                parentFrameSize = geo.size
            }
        }
        .background(Color.clear)
    }
    
    private func calculateCellSize(cellSize: CGSize, frameSize: CGSize) -> CGSize {
        let cellH: CGFloat = cellSize.height,
            cellW: CGFloat = cellSize.width,
            frameH: CGFloat = frameSize.height,
            frameW: CGFloat = frameSize.width
        
        if (frameH > frameW) {
            return CGSize(width: cellW, height: cellH / 2)
        } else if (frameH < frameW) {
            return CGSize(width: cellW / 2, height: cellH)
        } else {
            return cellSize
        }
    }
    
    func bottomCellSize(_ size: CGSize) -> GridLineBackground {
        var copy = self
        copy.bottomLayer = bottomLayer.cellSize(calculateCellSize(cellSize: size, frameSize: parentFrameSize))
        return copy
    }
    func topCellSize(_ size: CGSize) -> GridLineBackground {
        var copy = self
        copy.topLayer =
            topLayer.cellSize(calculateCellSize(cellSize: size, frameSize: parentFrameSize))
        return copy
    }
    
    func bottomShading(_ shading: GraphicsContext.Shading) -> GridLineBackground {
        var copy = self
        copy.bottomLayerShading = shading
        return copy
    }
    
    func topShading(_ shading: GraphicsContext.Shading) -> GridLineBackground {
        var copy = self
        copy.topLayerShading = shading
        return copy
    }
}

#Preview {
    GeometryReader { geo in
        let frameH: CGFloat = geo.size.height,
            frameW: CGFloat = geo.size.width
        ZStack{
            GridLineBackground()
                .bottomCellSize(CGSize(width: frameW * 2, height: frameH * 2))
                .topShading(.color(.black))
                .bottomShading(.color(.green))
        }
    }
}
