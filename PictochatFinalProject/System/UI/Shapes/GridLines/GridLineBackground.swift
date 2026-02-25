//
//  GridLineBackground.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/5/26.
//

import SwiftUI

struct GridLineBackground: View {
    var topGridStyle: GridLineStyle = GridLineStyle()
    var bottomGridStyle: GridLineStyle = GridLineStyle()
    
    internal var bottomLayer: GridLines = GridLines(),
                 topLayer: GridLines = GridLines()
                 
    @State internal var parentFrameSize: CGSize = CGSize(width: 100, height: 100)
        
    init() {
        
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                bottomLayer
                topLayer
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
}

#Preview {
    PreviewContainer {
        GeometryReader { geo in
            let frameH = geo.size.height,
                frameW = geo.size.width
            
            GridLineBackground()
        }
    }
}
