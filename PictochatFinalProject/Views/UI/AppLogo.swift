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
        GeometryReader { proxy in
            VStack {
                // MARK: - Logo ZStack
                ZStack {
                    // MARK: Right Bubble
                    ZStack {
                        VStack (spacing: 0) {
                            Rectangle()
                                .foregroundStyle(.green)
                                .frame(width: proxy.size.width * 0.65,
                                       height: proxy.size.height * 0.4)
                            DiagonalSlope()
                                .foregroundStyle(.green)
                                .frame(width: proxy.size.width * 0.15,
                                       height: proxy.size.height * 0.15)
                                .offset(x: proxy.size.width * -0.12)
                                .rotationEffect(Angle.degrees(180))
                        }
                        
                        Image(systemName: "pencil")
                            .resizable()
                            .frame(width: proxy.size.width * 0.30,
                                   height: proxy.size.height * 0.30)
                            .offset(y: proxy.size.height * -0.07)
                            .foregroundStyle(.secondary)
                        
                    }
                    .offset(x: proxy.size.width * 0.25,
                            y: proxy.size.width * 0.05)
                    // End of right Bubble
                    
                    // MARK: Left Bubble
                    ZStack {
                        VStack (spacing: 0) {
                            Rectangle()
                                .foregroundStyle(.orange)
                                .frame(width: proxy.size.width * 0.65,
                                       height: proxy.size.height * 0.4)
                            DiagonalSlope()
                                .foregroundStyle(.orange)
                                .frame(width: proxy.size.width * 0.15,
                                       height: proxy.size.height * 0.15)
                                .rotationEffect(Angle.degrees(180))
                                .offset(x: proxy.size.width * 0.12)
                                .scaleEffect(x: -1)
                        }
                        .frame(width: proxy.size.width * 0.65,
                               height: proxy.size.height * 0.65)
                        .offset(x: proxy.size.width * -0.25,
                                y: proxy.size.height * -0.15)
                        // End of left bubble VStack
                        
                        Image(systemName: "keyboard.fill")
                            .resizable()
                            .frame(width: proxy.size.width * 0.4,
                                   height: proxy.size.height * 0.3)
                            .offset(x: proxy.size.width * -0.25,
                                    y: proxy.size.height * -0.23)
                            .foregroundStyle(.secondary)
                    }// End of left bubble ZStack
                } // end ZStack
                .padding()
            } // end of VStack
            .frame(width: proxy.size.width,
                   height: proxy.size.height)
        } // end of GeometryReader
    } // end of body
} // end of AppLogo

#Preview {
    AppLogo()
        .frame(width: 150, height: 150)
}
