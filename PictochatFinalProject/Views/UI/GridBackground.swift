//
//  GridBackground.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/5/26.
//

import SwiftUI

struct GridBackground: View {
    @State var cellSize: CGSize// size of each cell
    @State var gridOffset: CGPoint = CGPoint(x: 0, y: 0)
    var isScrolling: Bool = false // are we a scrolling grid?
    
    var body: some View {
        ZStack {
        }
    }
}

#Preview {
    GridBackground(cellSize: CGSize(width: 16, height: 16))
}
