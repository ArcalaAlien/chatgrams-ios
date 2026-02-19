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
                // Left Chat Bubble
                ChatBubble()
                    .rotation3DEffect(Angle.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .scaledToFit()
                    .foregroundStyle(
                        LinearGradient(colors: [.appPrimaryAccent,
                                                .appPrimaryColor],
                                       startPoint: .top,
                                       endPoint: .bottom))
                    .offset(x: -frameW / 4, y: -frameH / 6)
                // End Left Chat Bubble
                
                // Right Chat Bubble
                ChatBubble()
                    .scaledToFit()
                    .foregroundStyle(
                        LinearGradient(colors: [.appSecondaryAccent,
                                                .appPrimaryColor],
                                       startPoint:  .top,
                                       endPoint: .bottom))
                    .offset(x: frameW / 4, y: frameH / 6)
                //End Right Chat Bubble
            } // end main bubble ZStack
        }// end of GeometryReader
    } // end of body
} // end of AppLogo

#Preview {
    AppLogo()
        .frame(width: 150, height: 150)
}
