//
//  GridLineStyle.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/14/26.
//

import SwiftUI

struct GridLineStyle {
    var cellSize: CGSize                        = CGSize(width: 300,
                                                         height: 300),
        lineShading: GraphicsContext.Shading    = .color(.black),
        gridStroke: StrokeStyle                 = StrokeStyle(lineWidth: 1),
        scrollStyle: GridScrollStyle            = .none,
        cameraPosition: CGPoint                 = CGPoint(x: 100,
                                                          y: 100),
        cameraOffset: CGPoint                   = .zero
}
