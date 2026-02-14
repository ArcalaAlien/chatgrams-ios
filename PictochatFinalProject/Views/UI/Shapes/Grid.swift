//
//  Grid.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/9/26.
//

import SwiftUI

struct Grid: View {
    var cellSize: CGSize
    private let xSize: CGFloat
    private let ySize: CGFloat
    
    init(cellSize: CGSize) {
        self.cellSize = cellSize
        self.xSize = cellSize.width
        self.ySize = cellSize.height
    }
    
    var body: some View {
        let gridItem: [GridItem] = [GridItem(.fixed(xSize))]
        
        GeometryReader { proxy in
            let numRows: CGFloat = proxy.size.width / xSize
            let numColumns: CGFloat = proxy.size.height / ySize
            
            ZStack{
                LazyHGrid(rows: gridItem) {
                    Rectangle()
                        .frame(width: xSize, height: ySize)
                }
                
                LazyVGrid(columns: gridItem) {
                    Rectangle()
                        .frame(width: xSize, height: ySize)
                }
            }
        }
    }
    
//    func path(in rect: CGRect) -> Path {
//        Path{ path in
//            for x in stride(from: 0, to: rect.width, by: xSize) {
//                path.move(to: CGPoint(x: 0, y: x))
//                path.addLine(to: CGPoint(x: rect.width, y: x))
//            }
//            
//            for y in stride(from: 0, to: rect.height, by: ySize) {
//                path.move(to: CGPoint(x: y, y: 0))
//                path.addLine(to: CGPoint(x: y, y: rect.height))
//            }
//        }
//    }
}

#Preview {
    VStack {
        Grid(cellSize: CGSize(width: 16, height: 16))
            .foregroundStyle(.green)
            .border(.red, width: 1)
    }
}
