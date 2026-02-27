//
//  GridLineStyle.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/14/26.
//

import SwiftUI

struct GridLineStyle {
    var cellSize: CGSize,
        lineShading: GraphicsContext.Shading,
        gridStroke: StrokeStyle,
        scrollStyle: GridScrollStyle,
        cameraPosition: CGPoint,
        cameraOffset: CGPoint
    
    init(cellSize: CGSize = CGSize(width: 96, height: 96),
         lineShading: GraphicsContext.Shading = .color(.black),
         gridStroke: StrokeStyle = StrokeStyle(lineWidth: 1),
         scrollStyle: GridScrollStyle = .none,
         cameraPosition: CGPoint = .zero,
         cameraOffset: CGPoint = .zero) {
        self.cellSize = cellSize
        self.lineShading = lineShading
        self.gridStroke = gridStroke
        self.scrollStyle = scrollStyle
        self.cameraPosition = cameraPosition
        self.cameraOffset = cameraOffset
    }
    
    func cellSize(_ size: CGSize) -> GridLineStyle {
        var copy = self
        copy.cellSize = size
        return copy
    }
    
    func cellSize(width: CGFloat, height: CGFloat) -> GridLineStyle {
        var copy = self
        copy.cellSize = CGSize(width: width, height: height)
        return copy
    }
    
    func lineShading(_ shading: GraphicsContext.Shading) -> GridLineStyle {
        var copy = self
        copy.lineShading = shading
        return copy
    }
    
    func gridStroke(_ stroke: StrokeStyle) -> GridLineStyle {
        var copy = self
        copy.gridStroke = stroke
        return copy
    }
    
    func scrollStyle(_ style: GridScrollStyle) -> GridLineStyle {
        var copy = self
        copy.scrollStyle = style
        return copy
    }
    
    func cameraPosition(_ position: CGPoint) -> GridLineStyle {
        var copy = self
        copy.cameraPosition = position
        return copy
    }
    
    func cameraOffset(_ offset: CGPoint) -> GridLineStyle {
        var copy = self
        copy.cameraOffset = offset
        return self
    }
}
