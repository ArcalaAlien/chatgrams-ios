//
//  GridLineBackground.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/5/26.
//

import SwiftUI

struct GridLineBackground: View {
    internal let bottomLayer: GridLines = GridLines(),
                 topLayer: GridLines = GridLines()
    
    internal var bottomLayerShading: GraphicsContext.Shading
    internal var topLayerShading: GraphicsContext.Shading
        
    init() {
        bottomLayerShading = .color(.black)
        topLayerShading = .color(.black)
    }
    
    internal init(topShading: GraphicsContext.Shading,
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
                                                frameSize: CGSize(width: frameW,
                                                                  height: frameH)))
                    .gridOffset(CGPoint(x: frameW / 5, y: .zero))
                    .lineShading(bottomLayerShading)
                
                topLayer
                    .scrollStyle(GridScrollStyle(scrollAngle: Angle(degrees: 45),
                                                 scrollSpeed: 17))
                    .cellSize(calculateCellSize(cellSize: CGSize(width: frameW / 3,
                                                                 height: frameH / 3),
                                                frameSize: CGSize(width: frameW,
                                                                  height: frameH)))
                    .lineShading(topLayerShading)
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
    GridLineBackground()
        .topShading(.color(.black))
        .bottomShading(.color(.green))
            
}
