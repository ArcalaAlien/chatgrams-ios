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
    
    func changeGradientsFromState (_ state: AppState.states) {
        switch (state) {
            case .lobby:
                topLayerShading = .color(.red)
                bottomLayerShading = .color(.black)
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
