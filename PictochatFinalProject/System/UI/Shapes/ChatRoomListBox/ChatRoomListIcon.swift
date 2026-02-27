//
//  ChatRoomListIcon.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/27/26.
//

import SwiftUI

struct PublicChatRoomListIcon: View {
    @EnvironmentObject var appTheme: AppTheme
    
    @State var isFilled: [[Bool]] = [[]]
    
    var body: some View {
        GeometryReader { geo in
            let frameH: CGFloat = geo.size.height,
                frameW: CGFloat = geo.size.width
            
            ZStack {
                Grid(alignment: .topTrailing,
                     horizontalSpacing: 0,
                     verticalSpacing: 0) {
                    ForEach(0..<4) {i in
                        GridRow {
                            ForEach(0..<4) {j in
                                Rectangle()
                                    .background(.black)
                            } // end of ForEach Button
                        } // end of GridRow
                    } // end of ForEach row
                } // end of Grid
                
                GridLines(GridLineStyle()
                    .cellSize(CGSize(width: frameW / 5,
                                     height: frameH / 5))
                    .lineShading(.color(appTheme.background)))
            } // end of ZStack
            .frame(width: frameW,
                   height: frameH)
        } // end of Geometry Reader
    } // end of body
} // end of struct

#Preview {
    PreviewContainer {
        PublicChatRoomListIcon()
            .frame(width: 200 , height: 200)
    }
}
