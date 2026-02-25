//
//  AppLogo.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/5/26.
//
import SwiftUI

struct AppLogo: View {
    @ObservedObject var appTheme: AppTheme = AppTheme.theme
    
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
                    .shadow(radius: 2)
                    .foregroundStyle(
                        LinearGradient(colors: [appTheme.accentOne,
                                                appTheme.accentOne,
                                                appTheme.background],
                                       startPoint: .top,
                                       endPoint: .bottom))
                    .offset(x: -frameW / 4, y: -frameH / 6)
                
                // TODO: Find easier way to do this
                Image(systemName: "pencil.and.scribble")
                    .resizable()
                    .scaledToFit()
                    .frame(width: frameW,
                           height: frameH / 2.25)
                    .scaledToFit()
                    .font(.system(size: frameH / 1.75))
                    .offset(x: -frameW / 4, y: (-frameH / 6) - (frameH / 4.75))
                    .foregroundStyle(LinearGradient(colors: [.white, .gray],
                                                    startPoint: .top,
                                                    endPoint: .bottom))
                    .opacity(1)
                // End Left Chat Bubble
                
                // Right Chat Bubble
                ChatBubble()
                    .scaledToFit()
                    .shadow(radius: 2)
                    .foregroundStyle(
                        LinearGradient(colors: [appTheme.accentTwo,
                                                appTheme.accentTwo,
                                                appTheme.background],
                                       startPoint:  .top,
                                       endPoint: .bottom))
                    .offset(x: frameW / 4, y: frameH / 6)
                Image(systemName: "keyboard.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: frameW,
                           height: frameH / 2.25)
                    .offset(x: frameW / 4, y: (frameH / 6) - (frameH / 4.75))
                    .foregroundStyle(LinearGradient(colors: [.white, .gray],
                                                    startPoint: .top,
                                                    endPoint: .bottom))
                    .opacity(1)
                //End Right Chat Bubble
            } // end main bubble ZStack
        }// end of GeometryReader
    } // end of body
} // end of AppLogo

#Preview {
    AppLogo()
        .frame(width: 150, height: 150)
}
