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
    
    func topGridStyle(_ style: GridLineStyle) {
        background = GridLineBackground(
            topGridStyle: style,
            bottomGridStyle: background.bottomGridStyle,
            parentFrameSize: frameSize
        )
    }
    
    func bottomGridStyle(_ style: GridLineStyle) {
        background = GridLineBackground(
            topGridStyle: background.topGridStyle,
            bottomGridStyle: style,
            parentFrameSize: frameSize
        )
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
                bottomGridStyle(
                    GridLineStyle()
                        .scrollStyle(GridScrollStyle(scrollAngle: Angle.degrees(30), scrollSpeed: -20))
                        .lineShading(.color(appTheme.accentFour)))
                topGridStyle(
                    GridLineStyle()
                        .lineShading(.color(appTheme.accentTwo)))
            case .lobby:
                switch(subState) {
                    case .publicGroups:
                        bottomGridStyle(
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
                        topGridStyle(
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
                    case .privateGroups:
                        bottomGridStyle(
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
                        topGridStyle(
                            GridLineStyle()
                                .lineShading(
                                    .linearGradient(Gradient(colors: [accentOne.darken(by: 200).toColor(in: environment), accentTwo.darken(by: 200).toColor(in: environment)]), startPoint: .zero,
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
                        bottomGridStyle(
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
                        topGridStyle(
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
                bottomGridStyle(
                    GridLineStyle()
                        .cellSize(CGSize(width: 10, height: 40))
                        .lineShading(.color(appTheme.background)))
                topGridStyle(
                    GridLineStyle()
                        .cellSize(CGSize(width: 50, height: 50))
                        .lineShading(.color(appTheme.background)))
            case .settings:
                bottomGridStyle(
                    GridLineStyle()
                        .cellSize(CGSize(width: 10, height: 40))
                        .lineShading(.color(appTheme.background)))
                topGridStyle(
                    GridLineStyle()
                        .cellSize(CGSize(width: 50, height: 50))
                        .lineShading(.color(appTheme.background)))
            default:
                bottomGridStyle(
                    GridLineStyle()
                        .cellSize(CGSize(width: 10, height: 40))
                        .lineShading(.color(appTheme.background)))
                topGridStyle(
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
