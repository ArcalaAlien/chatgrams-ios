//
//  LogoChatBubble.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/17/26.
//

import SwiftUI

struct LogoChatBubble<Fill: ShapeStyle>: View {
    var bubbleIcon: Image
    var bubbleStyle: Fill
    var iconStyle: Fill
    var mirrored: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            let frameH: CGFloat = geo.size.height,
                frameW: CGFloat = geo.size.width
            
            ZStack {
                VStack (spacing: 0) {
                    Rectangle()
                        .fill(bubbleStyle)
                        .frame(width: frameW, height: frameH / 1.5)
                    DiagonalSlope()
                        .fill(bubbleStyle)
                        .frame(width: frameW / 3, height: frameH / 3)
                        .rotation3DEffect(Angle.degrees(180),
                                          axis: mirrored ? (x: 1, y: 1, z: 0) :
                                                           (x: 1, y: 0, z: 0))
                        .offset(x: mirrored ? frameW / 5 : -frameW / 5)
                }
                
                bubbleIcon
                    .resizable()
                    .frame(width: frameW / 1.25, height: frameH / 2)
                    .scaledToFit()
                    .rotation3DEffect(Angle.degrees(180),
                                      axis: mirrored ? (x: 0, y: 1, z: 0) :
                                                       (x: 0, y: 0, z: 0))
                    .offset(y: -frameH / 5.5)
                    .foregroundStyle(iconStyle)
            } // end of bubble ZStack
        } // end of Geometry reader
    } // end of body
} // end of struct

#Preview {
    let bubble = LogoChatBubble(bubbleIcon: Image(systemName: "keyboard.fill"),
                   bubbleStyle: .green,
                   iconStyle: .secondary,
                   mirrored: true)
    
    
    bubble
        .shadow(radius: 10)
        .frame(width: 300, height: 300)
}
