//
//  DiagonalSlope.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/8/26.
//

import SwiftUI

struct DiagonalSlope: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        }
    }
}

#Preview {
    DiagonalSlope()
        .frame(width: 100, height: 100)
}
