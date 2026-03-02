//
//  GridLineBackgroundObserver.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/19/26.
//

import SwiftUI
internal import Combine

class GridLineBackgroundObserver: ObservableObject {
    var appState: AppState
    var appTheme: AppTheme
    
    @Published internal var background: GridLineBackground
    @Published internal var frameSize: CGSize
    @Published internal var environment: EnvironmentValues = EnvironmentValues()
    
    init() {
        appState = AppState.shared
        appTheme = AppTheme.theme
        background = GridLineBackground()
        frameSize = CGSize(width: 10, height: 10)
    }
    
    private init(topGridStyle: GridLineStyle,
                 bottomGridStyle: GridLineStyle,
                 frameSize: CGSize) {
        appState = AppState.shared
        appTheme = AppTheme.theme
        background = GridLineBackground(
            topGridStyle: topGridStyle,
            bottomGridStyle: bottomGridStyle,
            parentFrameSize: frameSize
        )
        self.frameSize = frameSize
    }
    
    func frameSize(_ size: CGSize) {
        frameSize = size
    }
    
    func topGridStyle(_ style: GridLineStyle) -> GridLineBackground {
        var copy = self.background
        copy = GridLineBackground(
            topGridStyle: style,
            bottomGridStyle: background.bottomGridStyle,
            parentFrameSize: frameSize
        )
        return copy
    }
    
    func bottomGridStyle(_ style: GridLineStyle) -> GridLineBackground {
        var copy = self.background
        copy = GridLineBackground(
            topGridStyle: background.topGridStyle,
            bottomGridStyle: style,
            parentFrameSize: frameSize
        )
        return copy
    }
    
    func changeBackground() {
        let state = appState.state,
            subState = appState.subState
        
        let accentOne = DynamicColor(color: appTheme.accentOne),
            accentTwo = DynamicColor(color: appTheme.accentTwo),
            accentThree = DynamicColor(color: appTheme.accentThree),
            accentFour = DynamicColor(color: appTheme.accentFour)
        
        switch (state) {
            case .logo:
                background = bottomGridStyle(
                    GridLineStyle()
                        .lineShading(.color(appTheme.background)))
                background = topGridStyle(
                    GridLineStyle()
                        .lineShading(.color(appTheme.background)))
            case .lobby:
                switch(subState) {
                    case .publicGroups:
                        background = bottomGridStyle(
                            GridLineStyle()
                                .lineShading(.color(appTheme.primary))
                                .cellSize(
                                    CGSize(width: frameSize.height * 30,
                                           height: frameSize.height * 30))
                                .scrollStyle(
                                    GridScrollStyle(
                                        scrollAngle: Angle.degrees(45),
                                        scrollSpeed: 10
                                    )
                                ))
                        background = topGridStyle(
                            GridLineStyle()
                                .lineShading(
                                    .linearGradient(Gradient(colors: [appTheme.accentOne,
                                         appTheme.accentTwo]),
                                                    startPoint: .zero,
                                                    endPoint:
                                                        CGPoint(x: frameSize.width * 30,
                                                                y: frameSize.height * 30))
                                )
                                .cellSize(
                                    CGSize(width: frameSize.width * 20,
                                           height: frameSize.width * 20)
                                )
                                .scrollStyle(
                                    GridScrollStyle(
                                        scrollAngle: Angle.degrees(-22.5),
                                        scrollSpeed: 4
                                )
                            )
                        )
                    case .privateGroups:
                        background = bottomGridStyle(
                            GridLineStyle()
                                .lineShading(.color(appTheme.primary))
                                .cellSize(
                                    CGSize(width: frameSize.height / 7.5,
                                           height: frameSize.height / 7.5))
                                .scrollStyle(
                                    GridScrollStyle(
                                        scrollAngle: Angle.degrees(45),
                                        scrollSpeed: 10
                                    )
                                ))
                        background = topGridStyle(
                            GridLineStyle()
                                .lineShading(
                                    .linearGradient(Gradient(colors: [accentOne.darken(by: 200).toColor(in: environment), accentTwo.darken(by: 50).toColor(in: environment)]), startPoint: .zero,
                                                    endPoint:
                                                        CGPoint(x: frameSize.width,
                                                                y: frameSize.height))
                                )
                                .cellSize(
                                    CGSize(width: frameSize.width / 2,
                                           height: frameSize.width / 2)
                                )
                                .scrollStyle(
                                    GridScrollStyle(
                                        scrollAngle: Angle.degrees(-22.5),
                                        scrollSpeed: 4
                                )
                            )
                        )
                    default:
                        background = bottomGridStyle(
                            GridLineStyle()
                                .lineShading(.color(appTheme.secondary))
                                .cellSize(
                                    CGSize(width: frameSize.height / 7.5,
                                           height: frameSize.height / 7.5))
                                .scrollStyle(
                                    GridScrollStyle(
                                        scrollAngle: Angle.degrees(45),
                                        scrollSpeed: 10
                                    )
                                ))
                        background = topGridStyle(
                            GridLineStyle()
                                .lineShading(
                                    .linearGradient(Gradient(colors: [accentOne.toColor(in: environment), accentTwo.toColor(in: environment)]), startPoint: .zero,
                                                    endPoint:
                                                        CGPoint(x: frameSize.width,
                                                                y: frameSize.height))
                                )
                                .cellSize(
                                    CGSize(width: frameSize.width / 2,
                                           height: frameSize.width / 2)
                                )
                                .scrollStyle(
                                    GridScrollStyle(
                                        scrollAngle: Angle.degrees(-22.5),
                                        scrollSpeed: 4
                                )
                            )
                        )
                }
            case .chatting:
                background = bottomGridStyle(
                    GridLineStyle()
                        .cellSize(CGSize(width: 10, height: 40))
                        .lineShading(.color(appTheme.background)))
                background = topGridStyle(
                    GridLineStyle()
                        .cellSize(CGSize(width: 50, height: 50))
                        .lineShading(.color(appTheme.background)))
            case .settings:
                background = bottomGridStyle(
                    GridLineStyle()
                        .cellSize(CGSize(width: 10, height: 40))
                        .lineShading(.color(appTheme.background)))
                background = topGridStyle(
                    GridLineStyle()
                        .cellSize(CGSize(width: 50, height: 50))
                        .lineShading(.color(appTheme.background)))
            default:
                background = bottomGridStyle(
                    GridLineStyle()
                        .cellSize(CGSize(width: 10, height: 40))
                        .lineShading(.color(appTheme.background)))
                background = topGridStyle(
                    GridLineStyle()
                        .cellSize(CGSize(width: 50, height: 50))
                        .lineShading(.color(appTheme.background)))
        } // end of case
    } // end of change gradient function
} // end of observer class

struct GridLineBGOPreview: View {
    @EnvironmentObject var appTheme: AppTheme
    @EnvironmentObject var bgObserver: GridLineBackgroundObserver
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Rectangle()
                    .foregroundStyle(appTheme.background)
                
                bgObserver
                    .background
                    .onAppear() {
                        bgObserver.frameSize(geo.size)
                    }
                
                Button(
                    action: {
                        withAnimation(.easeInOut(duration: 2)) {
                            bgObserver.changeBackground()
                        }
                    },
                    label: {
                        Text("Change Background")
                    }
                )
                .padding()
                .cornerRadius(20)
                .backgroundStyle(.black.opacity(0.5))
            }
        }
    }
}

#Preview {
    PreviewContainer {
        GridLineBGOPreview()
    }
}
