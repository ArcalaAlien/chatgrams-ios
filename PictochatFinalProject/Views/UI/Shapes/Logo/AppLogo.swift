//
//  AppLogo.swift
//  PictochatFinalProject
//
//  Created by 2155097-050 on 2/5/26.
//
import SwiftUI

struct AppLogo: View {
    var body: some View {
        // MARK: - Logo GeometryReader Start
        GeometryReader { geo in
            let frameH: CGFloat = geo.size.height,
                frameW: CGFloat = geo.size.width
            
            // MARK: - Logo ZStack
            ZStack {
                LogoChatBubble(bubbleIcon: Image(systemName: "keyboard.fill"),
                               bubbleStyle: Color.appSecondaryAccent,
                               iconStyle: Color.appSecondaryColor)
                .offset(x: -frameW / 2.75,
                        y: -frameH / 5)
                 // End of right chat bubble
                
                LogoChatBubble(bubbleIcon: Image(systemName: "pencil.and.scribble"),
                               bubbleStyle: Color.appPrimaryAccent,
                               iconStyle: Color.appSecondaryColor,
                               mirrored: true)
                .offset(x: frameW / 2.75,
                        y: frameH / 5)
            } // end main bubble ZStack
        } // end of GeometryReader
        .border(.red, width: 1)
    } // end of body
} // end of AppLogo

#Preview {
    AppLogo()
        .frame(width: 150, height: 150)
}
