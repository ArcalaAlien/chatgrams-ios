//
//  GridBackground.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/5/26.
//

import SwiftUI

struct GridBackground: View {
    let bottomLayer: GridLines = GridLines(),
        topLayer: GridLines = GridLines()
    
    var body: some View {
        GeometryReader { geo in
            let frameH = geo.size.height,
                frameW = geo.size.width
            
            ZStack {
                bottomLayer
                    .scrollStyle(GridScrollStyle(scrollAngle: Angle(degrees: -22.5),                                scrollSpeed: 10))
                    .cellSize(CGSize(width: 300, height: 300))
                    .gridOffset(CGPoint(x: frameH / 20, y: .zero))
                    .lineShading(.color(.appPrimaryColor))
                
                topLayer
                    .scrollStyle(GridScrollStyle(scrollAngle: Angle(degrees: 45),
                                                 scrollSpeed: 17))
                    .cellSize(CGSize(width: 105, height: 105))
                    .lineShading(
                        .linearGradient(
                            Gradient(colors: [.appPrimaryAccent,             .appSecondaryAccent]),
                            startPoint: .zero,
                            endPoint: CGPoint(x: frameW, y: frameH))
                        )
            }
        }.background(Color.clear)
    }
}

#Preview {
    GridBackground()
}
