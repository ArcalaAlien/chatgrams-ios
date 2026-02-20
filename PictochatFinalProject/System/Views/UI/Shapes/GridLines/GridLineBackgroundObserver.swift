//
//  GridLineBackgroundObserver.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/19/26.
//

import SwiftUI
internal import Combine

class GridLineBackgroundObserver: ObservableObject {
    @Published internal var background: GridLineBackground
    @Published var topLayerShading: GraphicsContext.Shading
    @Published var bottomLayerShading: GraphicsContext.Shading
    
    init() {
        background = GridLineBackground()
        topLayerShading = .color(.black)
        bottomLayerShading = .color(.black)
    }
    
    func changeGradientsFromState (_ appState: AppState, gradientStart: CGPoint, gradientEnd: CGPoint) {
        let state = appState.currentState,
            subState = appState.currentSubState
        
        withAnimation(.easeInOut(duration: 2)) {
            switch (state) {
                case .logo:
                    topLayerShading = .color(.blinderColor)
                    bottomLayerShading = .color(.blinderColor)
                case .lobby:
                    switch(subState) {
                        case .lobbyPublicTab:
                            self.topLayerShading =
                                .linearGradient(Gradient(colors: [.appPrimaryAccent,
                                                                  .appSecondaryAccent]),
                                                startPoint: gradientStart,
                                                endPoint: gradientEnd)
                            self.bottomLayerShading = .color(.black)
                        case .lobbyPrivateTab:
                            self.topLayerShading =
                                .linearGradient(Gradient(colors: [.purple,
                                                                  .appSecondaryAccent]),
                                                startPoint: gradientStart,
                                                endPoint: gradientEnd)
                            self.bottomLayerShading = .color(.black)
                        default:
                            self.topLayerShading = .color(.black)
                            self.bottomLayerShading = topLayerShading
                    }
                case .chatting:
                    topLayerShading = .color(.orange)
                    bottomLayerShading = .color(.black)
                case .settings:
                    topLayerShading = .color(.yellow)
                    bottomLayerShading = .color(.black)
                default:
                    topLayerShading = .color(.appGridBackgroundColor)
                    bottomLayerShading = .color(.appGridBackgroundColor)
            }
        }
    }
}
