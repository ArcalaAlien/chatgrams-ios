//
//  GridStyle.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/14/26.
//

import SwiftUI

/// A group of values
struct GridStyle {
    /// The x and y size of the cell
    var cellSize: CGSize
    
    /// Shading to pass through to the grid lines
    var lineShading: GraphicsContext.Shading
    
    /// The stroke style of the grid
    var stroke: StrokeStyle
    
    init(cellSize: CGSize                       = CGSize(width: 16, height: 16),
         lineShading: GraphicsContext.Shading   = .color(.black),
         stroke: StrokeStyle                    = StrokeStyle(lineWidth: 1,
                                                              lineCap: .square,
                                                              lineJoin: .miter,
                                                              miterLimit: 1,
                                                              dash: [],
                                                              dashPhase: 0)) {
        self.cellSize = cellSize
        self.lineShading = lineShading
        self.stroke = stroke
    }
}
