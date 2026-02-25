//
//  GridLineBackgroundObserver.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/19/26.
//

import SwiftUI
internal import Combine

class GridLineBackgroundObserver: ObservableObject {
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var appTheme: AppTheme
    
    @Published internal var background: GridLineBackground
    @Published internal var frameSize: CGSize
    @Published internal var environment: EnvironmentValues = EnvironmentValues()
    
    init() {
        background = GridLineBackground()
        frameSize = CGSize(width: 10, height: 10)
    }
    
    private func calculateCellSize(cellSize: CGSize, frameSize: CGSize) -> CGSize {
        let cellH: CGFloat = cellSize.height,
            cellW: CGFloat = cellSize.width,
            frameH: CGFloat = frameSize.height,
            frameW: CGFloat = frameSize.width
        
        if (frameH > frameW) {
            return CGSize(width: cellW, height: cellH / 2)
        } else if (frameH < frameW) {
            return CGSize(width: cellW / 2, height: cellH)
        } else {
            return cellSize
        }
    }
    
    func topCellSize(_ size: CGSize) -> GridLineBackgroundObserver {
        let copy = self
//        copy.background.topLayer =
//            background.topLayer.cellSize(
//                calculateCellSize(cellSize: size,
//                                  frameSize: frameSize))
//        return copy
        return self
    }
    
    func bottomShading(_ shading: GraphicsContext.Shading) -> GridLineBackgroundObserver {
//        let copy = self
//        copy.background.bottomLayer =
//            copy.background.bottomLayer.lineShading(shading)
//        return copy
        return self
    }
    
    func topShading(_ shading: GraphicsContext.Shading) -> GridLineBackgroundObserver {
//        let copy = self
//        copy.background.topLayer =
//            copy.background.topLayer.lineShading(shading)
//        return copy
        return self
    }
    
    func changeGradients() -> GridLineBackground {
//        let state = appState.state,
//            subState = appState.subState
//        
//        let bgColor = appTheme.background,
//            primary = appTheme.primary,
//            secondary = appTheme.secondary,
//            accentOne = DynamicColor(color: appTheme.accentOne),
//            accentTwo = DynamicColor(color: appTheme.accentTwo),
//            accentThree = DynamicColor(color: appTheme.accentThree),
//            accentFour = DynamicColor(color: appTheme.accentFour)
//        
//        var backgroundCopy = self.background
//        var topLayerCopy = backgroundCopy.topLayer
//        var botLayerCopy = backgroundCopy.bottomLayer
//        withAnimation(.easeIn(duration: 4)) {
//            switch (state) {
//                case .logo:
//                    botLayerCopy =
//                botLayerCopy.lineShading(.color(bgColor))
//                   topLayerCopy =
//                topLayerCopy.lineShading(.color(bgColor))
//                case .lobby:
//                    switch(subState) {
//                        case .publicGroups:
//                            botLayerCopy =
//                                botLayerCopy.lineShading(.color(secondary))
//                            topLayerCopy =
//                                topLayerCopy.lineShading(
//                                    .linearGradient(
//                                        Gradient(
//                                            colors: [accentOne.darken(by: 100).toColor(in: environment),
//                                                     accentTwo.darken(by: 100).toColor(in: environment)]),
//                                        startPoint: .zero,
//                                        endPoint: CGPoint(x: frameSize.width,
//                                                          y: frameSize.height)))
//                        case .privateGroups:
//                            botLayerCopy =
//                                botLayerCopy.lineShading(.color(secondary))
//                            topLayerCopy =
//                                topLayerCopy.lineShading(
//                                    .linearGradient(
//                                        Gradient(
//                                            colors: [accentThree.darken(by: 100).toColor(in: environment),
//                                                     accentTwo.darken(by: 100).toColor(in: environment)]),
//                                        startPoint: .zero,
//                                        endPoint: CGPoint(x: frameSize.width, y: frameSize.height)))
//                        default:
//                            botLayerCopy =
//                        botLayerCopy.lineShading(.color(bgColor))
//                           topLayerCopy =
//                               topLayerCopy.lineShading(.color(bgColor))
//                    }
//                case .chatting:
//                    botLayerCopy =
//                        botLayerCopy.lineShading(.color(primary))
//                    topLayerCopy =
//                        topLayerCopy.lineShading(
//                            .linearGradient(
//                                Gradient(
//                                    colors: [accentThree.darken(by: 100).toColor(in: environment),
//                                             accentTwo.darken(by: 100).toColor(in: environment)]),
//                                startPoint: .zero,
//                                endPoint: CGPoint(x: frameSize.width,
//                                                  y: frameSize.height)))
//                case .settings:
//                    botLayerCopy =
//                        botLayerCopy.lineShading(.color(.black))
//                    topLayerCopy =
//                        topLayerCopy.lineShading(
//                            .linearGradient(
//                                Gradient(
//                                    colors: [accentThree.darken(by: 100).toColor(in: environment),
//                                             accentFour.darken(by: 100).toColor(in: environment)]),
//                                startPoint: .zero,
//                                endPoint: CGPoint(x: frameSize.width,
//                                                  y: frameSize.height)))
//                default:
//                    botLayerCopy =
//                        botLayerCopy.lineShading(.color(bgColor))
//                   topLayerCopy =
//                        topLayerCopy.lineShading(.color(bgColor))
//            } // end of case
//        } // end of withAnimation
//        
//        backgroundCopy.topLayer = topLayerCopy
//        backgroundCopy.bottomLayer = botLayerCopy
//        return backgroundCopy
        return self.background
    } // end of change gradient function
} // end of observer class

#Preview {
    var bgObserver = GridLineBackgroundObserver()
    
    GeometryReader { geo in
        let frameH = geo.size.height,
            frameW = geo.size.width
        
        PreviewContainer {
            bgObserver.background
//                .onAppear() {
//                    bgObserver.background.topLayer =
//                    bgObserver.background.topLayer
//                        .cellSize(CGSize(width: frameW, height: frameH))
//                        .scrollStyle(GridScrollStyle(scrollAngle: Angle.degrees(-22.5), scrollSpeed: 10))
//                        .lineShading(
//                            .linearGradient(
//                                Gradient(
//                                    colors: [AppTheme.theme.accentOne,
//                                             AppTheme.theme.accentTwo]),
//                                    startPoint: .zero,
//                                endPoint: CGPoint(x: frameW,
//                                                  y: frameH)))
//                }
        }
    }
}
