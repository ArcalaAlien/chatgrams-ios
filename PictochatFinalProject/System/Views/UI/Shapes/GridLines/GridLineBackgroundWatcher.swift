//
//  GridLineBackgroundWatcher.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/19/26.
//

import SwiftUI
internal import Combine

class GridLineBackgroundWatcher: ObservableObject {
    @Published internal var background: GridLineBackground
    @Published var topLayerShading: GraphicsContext.Shading
    @Published var bottomLayerShading: GraphicsContext.Shading
    
    init() {
        background = GridLineBackground()
        topLayerShading = .color(.black)
        bottomLayerShading = .color(.black)
    }
    
}
