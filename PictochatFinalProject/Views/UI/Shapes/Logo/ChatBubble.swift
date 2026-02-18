//
//  ChatBubble.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/18/26.
//

import SwiftUI

struct ChatBubble: Shape {
    func path(in rect: CGRect) -> Path {
        let frameH: CGFloat = rect.size.height,
            frameW: CGFloat = rect.size.width
        var path: Path = Path()
        
        path.move(to: .zero)
        
        // Drawing the bubble square
        path.addLine(to: CGPoint(x: frameW, y: -95))
        path.addLine(to: CGPoint(x: frameW, y: frameH / 2))
        path.addLine(to: CGPoint(x: frameW / 1.35, y: frameH / 2))
        
        // Drawing little bubble triangle thing
        path.addLine(to: CGPoint(x: frameW / 1.35, y: frameH / 1.25))
        path.addLine(to: CGPoint(x: frameW / 2.5, y: frameH / 2))
        
        // Back to finish the bubble.
        path.addLine(to: CGPoint(x: 0, y: frameH / 2))
        path.addLine(to: .zero)
        path.closeSubpath()
        return path
    }
}

#Preview {
    ZStack {
        Rectangle().fill(Color.blue)
        ChatBubble()
            .stroke(style: StrokeStyle(lineWidth: 8))
            .foregroundStyle(Color.red)
    }.frame(width: 300, height: 300)
}
