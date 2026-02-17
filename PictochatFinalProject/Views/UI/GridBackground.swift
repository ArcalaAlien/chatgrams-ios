//
//  GridBackground.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/5/26.
//

import SwiftUI

struct GridBackground: View {
    let bottomLayer: GridLines = GridLines()
    let topLayer: GridLines = GridLines()
    
    var body: some View {
        GeometryReader { geo in
            let frameH = geo.size.height,
                frameW = geo.size.width
            
            ZStack {
                bottomLayer
                    .scrollStyle(GridScrollStyle(scrollAngle: Angle(degrees: -45),
                                                 scrollSpeed: 15))
                    .cellSize(CGSize(width: 300, height: 300))
                    .lineShading(.color(.secondary))
                topLayer
                    .scrollStyle(GridScrollStyle(scrollAngle: Angle(degrees: 45),
                                                 scrollSpeed: 17))
                    .cellSize(CGSize(width: 105, height: 105))
                    .lineShading(.linearGradient(Gradient(colors: [.appPrimaryAccent, .appSecondaryAccent]),
                                                 startPoint: CGPoint(x: 0,
                                                                     y: 0),
                                                 endPoint: CGPoint(x: frameW,
                                                                   y: frameH)))
            }
        }
    }
}

#Preview {
    GridBackground()
}
